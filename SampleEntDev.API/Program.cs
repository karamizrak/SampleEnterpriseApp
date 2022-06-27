using SampleEntDev.Repository;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.EntityFrameworkCore;
using Npgsql.EntityFrameworkCore.PostgreSQL;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Repository.Repositories;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Services;
using SampleEntDev.Service.Mapping;
using SampleEntDev.API.Filter;
using SampleEntDev.Repository.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using SampleEntDev.Service.Services.Schemas.ECommerce;
using FluentValidation.AspNetCore;
using SampleEntDev.Service.Validations;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.MiddleWares;
using Autofac.Extensions.DependencyInjection;
using Autofac;
using SampleEntDev.API.Modules;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers(opt=>
{
    opt.Filters.Add(new ValidateFilterAttribute());
})
    .AddFluentValidation(x=> x.RegisterValidatorsFromAssemblyContaining<ProductDtoValidator>());

//Fluent Validator ýn dönmüþ olduðu model filtresini kapatmak için
builder.Services.Configure<ApiBehaviorOptions>(opt =>
{
    opt.SuppressModelStateInvalidFilter = true;
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(c =>
{
    c.OperationFilter<TagByAreaNameOperationFilter>();
});

//builder.Services.AddDbContext<AppDbContext>(x =>
//{
//    x.UseNpgsql()
//});
builder.Services.AddNpgsql<AppDbContext>(builder.Configuration.GetConnectionString("DefaultConnection"));

builder.Services.AddScoped(typeof(NotFoundFilter<>));
builder.Services.AddAutoMapper(typeof(MapProfile));
builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
builder.Host.ConfigureContainer<ContainerBuilder>(containerBuilder => containerBuilder.RegisterModule(new RepoServiceModule()));

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCustomException();

app.UseAuthorization();


app.MapControllers();
//app.MapControllerRoute(
//    name: "default",
//    pattern: "{controller=Home}/{action=Index}/{id?}");


app.Run();

