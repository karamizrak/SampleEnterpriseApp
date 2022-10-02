using System.Text;
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
using Serilog.Core;
using Serilog.Events;
using Serilog.Sinks.PostgreSQL;
using ILogger = Microsoft.Extensions.Logging.ILogger;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddHttpContextAccessor();
// Add services to the container.

builder.Services.AddControllers(opt => { opt.Filters.Add(new ValidateFilterAttribute()); })
    .AddFluentValidation(x => x.RegisterValidatorsFromAssemblyContaining<ProductDtoValidator>());

//Turned off the pattern filter that the "Fluent Validator" had returned.
builder.Services.Configure<ApiBehaviorOptions>(opt => { opt.SuppressModelStateInvalidFilter = true; });

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
{
    //c.OperationFilter<TagByAreaNameOperationFilter>();
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

LdapConfig ldapConfig = builder.Configuration.GetSection("AD").Get<LdapConfig>();
builder.Services.Configure<LdapConfig>
(
    c =>
    {
        c.Zone = ldapConfig.Zone;
        c.Port = ldapConfig.Port;
        c.Path = ldapConfig.Path;
        c.Domain = ldapConfig.Domain;
        c.LDAPserver = $"{c.Domain}.{c.Zone}";
        c.LDAPQueryBase = $"DC={c.Domain},DC={c.Zone}";
        c.OUGroup = new StringBuilder().Append($"OU={ldapConfig.OUGroup},").Append($"CN=Users,{c.LDAPQueryBase}")
            .ToString();

        //OU=gsb,DC=gsb,DC=local
    }
);


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
builder.Logging.ClearProviders();
builder.Logging.AddSeriLogx(connStr);


var app = builder.Build();

IHostApplicationLifetime lifetime = app.Lifetime;
IWebHostEnvironment env = app.Environment;

lifetime.ApplicationStarted.Register(() =>
    app.Logger.LogInformation(
        $"The application {env.ApplicationName} started"
    ));

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCustomException(app.Logger);

app.UseAuthentication();
app.UseAuthorization();

app.UseCors();

app.MapControllers();


app.Run();