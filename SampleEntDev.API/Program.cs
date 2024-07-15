using Autofac;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Config;
using SampleEntDev.API.Filter;
using SampleEntDev.API.MiddleWares;
using SampleEntDev.API.Modules;
using SampleEntDev.Core.Security;
using SampleEntDev.Repository;
using SampleEntDev.Service.Mapping;
using Serilog;
#region Main configuration
var builder = WebApplication.CreateBuilder(args);
var connStr = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.Configure<TokenOptions>(builder.Configuration.GetSection("TokenOptions"));

builder.Services.AddHttpContextAccessor();

builder.Services.AddControllers(opt => { opt.Filters.Add(new ValidateFilterAttribute()); });

builder.Services.Configure<ApiBehaviorOptions>(opt => { opt.SuppressModelStateInvalidFilter = true; });

builder.Services.AddEndpointsApiExplorer();
#endregion

#region Must include
builder.Services.AddNpgsql<AppDbContext>(connStr);

builder.Services.AddAutoMapper(typeof(MapProfile));

builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());

builder.Host.ConfigureContainer<ContainerBuilder>(containerBuilder => containerBuilder.RegisterModule(new RepoServiceModule()));

builder.AddSwaggerConfig();

builder.AddAuthenticationConfig();

builder.AddCrossOrgin();

builder.Logging.ClearProviders();
//SerilogRegistration.ConfigureLogging();
builder.AddSerilog();


#endregion

#region Maybe

builder.AddLdapConfig();

#endregion

#region Web app builder
var app = builder.Build();
app.UseSerilog();
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
#endregion
