using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Repository.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        protected readonly AppDbContext context;
        private readonly DbSet<T> dbSet;
        public GenericRepository(AppDbContext context)
        {
            this.context = context;
            dbSet = context.Set<T>();   
        }
        public async Task AddAsync(T entity)
        {
            await context.AddAsync(entity);
        }

        public async Task AddRangeAsync(IEnumerable<T> entities)
        {
            await context.AddRangeAsync(entities);

        }

        public async Task<bool> AnyAsync(Expression<Func<T, bool>> expression)
        {
          return  await dbSet.AnyAsync(expression);
        }

        public async Task<T> GetByIdAsync(int id)
        {
#pragma warning disable CS8603 // Possible null reference return.
            return await dbSet.FindAsync(id);
#pragma warning restore CS8603 // Possible null reference return.
        }

        public void Remove(T entity)
        {
            //context.Entry(entity).State = EntityState.Deleted;
            dbSet.Remove(entity);   
        }

        public void RemoveRange(IEnumerable<T> entities)
        {
            dbSet.RemoveRange(entities);
        }

        public void Update(T entity)
        {
            dbSet.Update(entity);
        }

        public IQueryable<T> Where(Expression<Func<T, bool>> expression)
        {
            return dbSet.Where(expression);
        }

        public IQueryable<T> GetAll(Expression<Func<T, bool>> expression)
        {
            return dbSet.AsNoTracking().Where(expression);
        }
    }
}
