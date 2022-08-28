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
            SetDatetime();
            context.SaveChanges();
        }

        public async Task CommitAsync()
        {
            SetDatetime();
            await context.SaveChangesAsync();
        }

        private void SetDatetime()
        {
            context.ChangeTracker.Entries().ToList().ForEach(e =>
            {
                if (e.State == EntityState.Added)
                {
                    e.Property("CreatedDate").CurrentValue = DateTime.Now;
                }

                if (e.State == EntityState.Modified)
                {
                    e.Property("UpdatedDate").CurrentValue = DateTime.Now;
                }
            });
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