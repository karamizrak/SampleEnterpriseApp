﻿using Autofac;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Repository;
using SampleEntDev.Repository.Repositories;
using SampleEntDev.Service.Mapping;
using System.Reflection;
using SampleEntDev.Service.Services;
using SampleEntDev.Core.Services;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Caching;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using SampleEntDev.Service.Services.Schemas.Management;
using SampleEntDev.Core.Services.Schemas.Management;
using SampleEntDev.Core.Security;
using SampleEntDev.API.Filter;

namespace SampleEntDev.API.Modules
{
    public class RepoServiceModule : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterGeneric(typeof(GenericRepository<>)).As(typeof(IGenericRepository<>))
                .InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(GenericService<>)).As(typeof(IGenericService<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(NotFoundFilter<>)).InstancePerLifetimeScope();
            builder.RegisterGeneric(typeof(GetByIdFilter<,>)).InstancePerLifetimeScope();


            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>();
            builder.RegisterType<TokenHandler>().As<ITokenHandler>();
            builder.RegisterType(typeof(SampleEntDev.API.Filter.CustomAuthorizationAttribute))
                .InstancePerLifetimeScope();

            var apiAssembly = Assembly.GetExecutingAssembly();
            var repoAssembly = Assembly.GetAssembly(typeof(AppDbContext));
            var serviceAssembly = Assembly.GetAssembly(typeof(MapProfile));

            builder.RegisterAssemblyTypes(apiAssembly, repoAssembly ?? throw new InvalidOperationException("Map profile repository assembly isn't reading''"), serviceAssembly ?? throw new InvalidOperationException("Map profile service assembly isn't reading!!!"))
                .Where(x => x.Name.EndsWith("Repository")).AsImplementedInterfaces().InstancePerLifetimeScope();

            //InstancePerLifetimeScope => AddScope 
            //InstancePerDependency => AddTransient

            builder.RegisterAssemblyTypes(apiAssembly, repoAssembly, serviceAssembly)
                .Where(x => x.Name.EndsWith("Service")).AsImplementedInterfaces().InstancePerLifetimeScope();
            //builder.RegisterType<ProductServiceWithCaching>().As<IProductService>();
        }
    }
}