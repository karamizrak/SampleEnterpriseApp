﻿using Microsoft.EntityFrameworkCore;
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

        public async Task<T> AddAsync(T entity)
        {
            await context.AddAsync(entity);
            return entity;
        }

        public async Task AddRangeAsync(IEnumerable<T> entities)
        {
            await context.AddRangeAsync(entities);
        }

        public async Task<bool> AnyAsync(Expression<Func<T, bool>> expression)
        {
            return await dbSet.AnyAsync(expression);
        }

        public async Task<T> GetByIdAsync(int id)
        {
#pragma warning disable CS8603 // Possible null reference return.
            return await dbSet.FindAsync(id);
#pragma warning restore CS8603 // Possible null reference return.
        }

        public IQueryable<T> GetAll()
        {
            return dbSet.AsNoTracking().AsQueryable();
        }

        public void Remove(T entity)
        {
            //context.Entry(entity).State = EntityState.Deleted;
            var property = entity.GetType().GetProperty("IsDeleted");
            if (property != null)
            {
                property.SetValue(entity, true);
            }

            Update(entity);
            //dbSet.Remove(entity);
        }


        public T Update(T entity)
        {
            dbSet.Update(entity);
            return (T)entity;
        }

        public IQueryable<T> GetAll(Expression<Func<T, bool>> expression)
        {
            return dbSet.AsNoTracking().Where(expression);
        }

        public IQueryable<T> Query()
        {
            return context.Set<T>().AsQueryable();
        }



        public IQueryable<T> WhereIq(Expression<Func<T, bool>> expression)
        {
            return dbSet.Where(expression);
        }

        public IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate)
        {

            IQueryable<T> query = this.WhereIq(filterPredicate);
            query = orderByPredicate(query);
            return query;
        }

        public IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate, string navigationProperties)
        {
            var query = this.WhereIq(filterPredicate, orderByPredicate);

            query = orderByPredicate(query);

            foreach (string navigationPropertyPath in navigationProperties.Split(new[] { ',' },
                         StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(navigationPropertyPath);
            }

            return query;
        }

        public IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate, string navigationProperties, int page, int pageSize)
        {
            var query = this.WhereIq(filterPredicate, orderByPredicate, navigationProperties);
            foreach (string navigationPropertyPath in navigationProperties.Split(new[] { ',' },
                         StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(navigationPropertyPath);
            }


            query = query.Skip((page - 1) * pageSize).Take(pageSize);

            return query;
        }
    }
}