using SampleEntDev.Core.IUnitOfWorks;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.Helper;

namespace SampleEntDev.Repository.Repositories
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly AppDbContext context;

        public UnitOfWork(AppDbContext context)
        {
            this.context = context;
        }

        public void Commit()
        {
            context.ChangeTracker.Entries().ToList().ForEach(e =>
            {
                if (e.State == EntityState.Added)
                {
                    PropertyReflection.SetValue(e, "CreatedDate", DateTime.Now);
                }

                if (e.State == EntityState.Modified)
                {
                    PropertyReflection.SetValue(e, "UpdatedDate", DateTime.Now);
                }
            });
            context.SaveChanges();
        }

        public async Task CommitAsync()
        {
            //context.ChangeTracker.Entries().ToList().ForEach(e =>
            //{
            //    if (e.State == EntityState.Added)
            //    {
            //        PropertyReflection.SetValue(e, "CreatedDate", DateTime.Now);
            //    }

            //    if (e.State == EntityState.Modified)
            //    {
            //        PropertyReflection.SetValue(e, "UpdatedDate", DateTime.Now);
            //    }
            //});
            await context.SaveChangesAsync();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                context.Dispose();
            }
        }
    }
}