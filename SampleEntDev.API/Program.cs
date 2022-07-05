
using Autofac;
using Autofac.Extensions.DependencyInjection;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using SampleEntDev.API.Filter;
using SampleEntDev.API.MiddleWares;
using SampleEntDev.API.Modules;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Repositories.Schemas.Management;
using SampleEntDev.Core.Security;
using SampleEntDev.Core.Services;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using SampleEntDev.Core.Services.Schemas.Management;
using SampleEntDev.Repository;
using SampleEntDev.Repository.Repositories;
using SampleEntDev.Repository.Repositories.Management;
using SampleEntDev.Repository.Repositories.Schemas.ECommerce;
using SampleEntDev.Service.Mapping;
using SampleEntDev.Service.Services.Schemas.ECommerce;
using SampleEntDev.Service.Services.Schemas.Management;
using SampleEntDev.Service.Validations;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers(opt=>
{
    opt.Filters.Add(new ValidateFilterAttribute());
})
    .AddFluentValidation(x=> x.RegisterValidatorsFromAssemblyContaining<ProductDtoValidator>());

//Turned off the pattern filter that the "Fluent Validator" had returned.
builder.Services.Configure<ApiBehaviorOptions>(opt =>
{
    opt.SuppressModelStateInvalidFilter = true;
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
{
  
    c.OperationFilter<TagByAreaNameOperationFilter>();
    c.DocumentFilter<OrderTagsDocumentFilter>();
    c.OrderActionsBy((apiDesc) =>$"{apiDesc.ActionDescriptor.RouteValues["area"]}_{apiDesc.ActionDescriptor.RouteValues["controller"]}_{apiDesc.ActionDescriptor.RouteValues["action"]}");

    c.AddSecurityDefinition(name: "Bearer", securityScheme: new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Description = "Enter the Bearer Authorization string as following: `Bearer Generated-JWT-Token`",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type=ReferenceType.SecurityScheme,
                    Id="Bearer"
                }
            },
            new string[]{}
        }
    });
});
builder.Services.AddMemoryCache();
builder.Services.AddNpgsql<AppDbContext>(builder.Configuration.GetConnectionString("DefaultConnection"));
builder.Services.AddAutoMapper(typeof(MapProfile));
//builder.Services.AddScoped(typeof(NotFoundFilter<>));
//builder.Services.AddScoped(typeof(GetByIdFilter<,>));
//builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
//builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));
//builder.Services.AddScoped(typeof(IGenericService<>), typeof(SampleEntDev.Service.Services.GenericService<>));

//builder.Services.AddScoped<ITokenHandler, TokenHandler>();
//builder.Services.AddScoped<IProductRepository, ProductRepository>();
//builder.Services.AddScoped<IProductService, ProductService>();
//builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
//builder.Services.AddScoped<ICategoryService, CategoryService>();
//builder.Services.AddScoped<IAuthService, AuthService>();
//builder.Services.AddScoped<IUserService, UserService>();
//builder.Services.AddScoped<IUserRepository, UserRepository>();

builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
builder.Host.ConfigureContainer<ContainerBuilder>(containerBuilder => containerBuilder.RegisterModule(new RepoServiceModule()));

builder.Services.Configure<TokenOptions>(builder.Configuration.GetSection("TokenOptions"));
TokenOptions tokenOptions = builder.Configuration.GetSection("TokenOptions").Get<TokenOptions>();
builder.Services.AddAuthentication(x=>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

}).AddJwtBearer(jwtBearerConfig =>
{
    jwtBearerConfig.SaveToken = true;
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

