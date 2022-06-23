using System.Linq.Expressions;

namespace SampleEntDev.Core.Repositories
{
    public interface IGenericRepository<T> where T : class
    {
        Task<T> GetByIdAsync(int id);
        IQueryable<T> Where(Expression<Func<T,bool>> expression);
        Task AddAsync(T entity);
        Task AddRangeAsync(IEnumerable<T> entities);
        void Update(T entity);
        Task<bool> AnyAsync(Expression<Func<T,bool>> expression);
        void Remove(T entity);
        void RemoveRange(IEnumerable<T> entities);
    }
}
