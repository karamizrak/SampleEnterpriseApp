using Autofac;
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

namespace SampleEntDev.API.Modules
{
    public class RepoServiceModule: Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterGeneric(typeof(GenericRepository<>)).As(typeof(IGenericRepository<>)).InstancePerLifetimeScope();

            builder.RegisterGeneric(typeof(GenericService<>)).As(typeof(IGenericService<>)).InstancePerLifetimeScope();

            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>();

            var apiAssembly = Assembly.GetExecutingAssembly();
            var repoAssembly= Assembly.GetAssembly(typeof(AppDbContext));
            var serviceAssembly= Assembly.GetAssembly(typeof(MapProfile));

            builder.RegisterAssemblyTypes(apiAssembly,repoAssembly,serviceAssembly).Where(x=> x.Name.EndsWith("Repository")).AsImplementedInterfaces().InstancePerLifetimeScope();

            //InstancePerLifetimeScope => AddScope 
            //InstancePerDependency => AddTransient

            builder.RegisterAssemblyTypes(apiAssembly, repoAssembly, serviceAssembly).Where(x => x.Name.EndsWith("Service")).AsImplementedInterfaces().InstancePerLifetimeScope();
            builder.RegisterType<ProductServiceWithCaching>().As<IProductService>();
        }
    }
}
