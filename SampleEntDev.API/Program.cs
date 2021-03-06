using Autofac;
using Autofac.Extensions.DependencyInjection;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using NpgsqlTypes;
using SampleEntDev.API.Filter;
using SampleEntDev.API.MiddleWares;
using SampleEntDev.API.Modules;
using SampleEntDev.Core.Security;
using SampleEntDev.Repository;
using SampleEntDev.Service.Mapping;
using SampleEntDev.Service.Validations;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.PostgreSQL;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers(opt => { opt.Filters.Add(new ValidateFilterAttribute()); })
    .AddFluentValidation(x => x.RegisterValidatorsFromAssemblyContaining<ProductDtoValidator>());

//Turned off the pattern filter that the "Fluent Validator" had returned.
builder.Services.Configure<ApiBehaviorOptions>(opt => { opt.SuppressModelStateInvalidFilter = true; });

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
{
    c.OperationFilter<TagByAreaNameOperationFilter>();
    c.DocumentFilter<OrderTagsDocumentFilter>();
    c.OrderActionsBy((apiDesc) =>
        $"{apiDesc.ActionDescriptor.RouteValues["area"]}_{apiDesc.ActionDescriptor.RouteValues["controller"]}_{apiDesc.ActionDescriptor.RouteValues["action"]}");

    c.AddSecurityDefinition(name: "Bearer", securityScheme: new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Description = "Enter the Bearer Authorization string as following: `Bearer Generated-JWT-Token`",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] { }
        }
    });
});
var connStr = builder.Configuration.GetConnectionString("DefaultConnection");
//builder.Services.AddMemoryCache();
builder.Services.AddNpgsql<AppDbContext>(connStr);
builder.Services.AddAutoMapper(typeof(MapProfile));

builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
builder.Host.ConfigureContainer<ContainerBuilder>(containerBuilder =>
    containerBuilder.RegisterModule(new RepoServiceModule()));

builder.Services.Configure<TokenOptions>(builder.Configuration.GetSection("TokenOptions"));
TokenOptions tokenOptions = builder.Configuration.GetSection("TokenOptions").Get<TokenOptions>();
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(jwtBearerConfig =>
{
    jwtBearerConfig.SaveToken = true;
    jwtBearerConfig.RequireHttpsMetadata = false;
    jwtBearerConfig.TokenValidationParameters =
        new Microsoft.IdentityModel.Tokens.TokenValidationParameters()
        {
            ValidateAudience = true,
            ValidateIssuer = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = tokenOptions.Issuer,
            ValidAudience = tokenOptions.Audience,
            IssuerSigningKey = SignHandler.GetSecurityKey(tokenOptions.SecretKey),
            ClockSkew = TimeSpan.Zero
        };
});

builder.Services.AddCors(opts =>
{
    opts.AddDefaultPolicy(builder => { builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod(); });
});


var loger = new LoggerConfiguration()
    .MinimumLevel.Override("Default", LogEventLevel.Verbose)
    .WriteTo.PostgreSQL(connStr, "logs4", new Dictionary<string, ColumnWriterBase>
    {
        { "message", new RenderedMessageColumnWriter(NpgsqlDbType.Text) },
        { "message_template", new MessageTemplateColumnWriter(NpgsqlDbType.Text) },
        { "level", new LevelColumnWriter(true, NpgsqlDbType.Varchar) },
        { "raise_date", new TimestampColumnWriter(NpgsqlDbType.Timestamp) },
        { "exception", new ExceptionColumnWriter(NpgsqlDbType.Text) },
        { "properties", new LogEventSerializedColumnWriter(NpgsqlDbType.Jsonb) },
        { "props_test", new PropertiesColumnWriter(NpgsqlDbType.Jsonb) },
        {
            "machine_name",
            new SinglePropertyColumnWriter("MachineName", PropertyWriteMethod.ToString, NpgsqlDbType.Text, "l")
        }
    }, schemaName: "global")
    .CreateLogger();
builder.Logging.ClearProviders();
builder.Logging.AddSerilog(logger: loger);

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCustomException();

app.UseAuthentication();
app.UseAuthorization();

app.UseCors();

app.MapControllers();


app.Run();
Log.Information("WebApi Starting...");