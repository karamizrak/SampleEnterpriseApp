using System.Linq.Expressions;

namespace SampleEntDev.Core.Repositories
{
    public interface IGenericRepository<T> where T : class
    {
        Task<T> GetByIdAsync(int id);
        Task<T> AddAsync(T entity);
        Task AddRangeAsync(IEnumerable<T> entities);
        IQueryable<T> GetAll();
        IQueryable<T> GetAll(Expression<Func<T, bool>> expression);
        T Update(T entity);
        Task<bool> AnyAsync(Expression<Func<T, bool>> expression);
        void Remove(T entity);

        IQueryable<T> Query();

        IQueryable<T> WhereIq(Expression<Func<T, bool>> expression);

        IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate);

        IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate, string navigationProperties);

        IQueryable<T> WhereIq(Expression<Func<T, bool>> filterPredicate, Func<IQueryable<T>, IOrderedQueryable<T>> orderByPredicate, string navigationProperties, int page, int pageSize);
    }
}