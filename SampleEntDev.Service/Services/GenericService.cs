using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Services;
using SampleEntDev.Service.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace SampleEntDev.Service.Services
{
    public class GenericService<T> : IGenericService<T> where T : class
    {
        private readonly IGenericRepository<T> _repository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public GenericService(IGenericRepository<T> repository, IUnitOfWork unitOfWork,
            IHttpContextAccessor httpContextAccessor)
        {
            _repository = repository;
            _unitOfWork = unitOfWork;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<T> AddAsync(T entity)
        {
            SetLastModifier(entity);
            await _repository.AddAsync(entity);
            await _unitOfWork.CommitAsync();
            return entity;
        }

        public async Task<IEnumerable<T>> AddRangeAsync(IEnumerable<T> entities)
        {
            var addRangeAsync = entities.ToList();
            foreach (var entity in addRangeAsync)
            {
                SetLastModifier(entity);
            }

            await _repository.AddRangeAsync(addRangeAsync);
            await _unitOfWork.CommitAsync();
            return addRangeAsync;
        }

        public Task<bool> AnyAsync(Expression<Func<T, bool>> expression)
        {
            return _repository.AnyAsync(expression);
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            return await _repository.GetAll().ToListAsync();
        }

        public async Task<IEnumerable<T>> GetAllAsync(Expression<Func<T, bool>> expression)
        {
            return await _repository.GetAll(expression).ToListAsync();
        }

        public async Task<T> GetByIdAsync(int id)
        {
            var record = await _repository.GetByIdAsync(id);
            //if(record==null )
            //{
            //    throw new NotFoundException($"{typeof(T).Name} ({id}) not found");
            //}
            return record;
        }

        public async Task RemoveAsync(T entity)
        {
            SetLastModifier(entity);
            _repository.Remove(entity);

            await _unitOfWork.CommitAsync();
        }


        public async Task UpdateAsync(T entity)
        {
            SetLastModifier(entity);
            _repository.Update(entity);
            await _unitOfWork.CommitAsync();
        }

        public IQueryable<T> Where(Expression<Func<T, bool>> expression)
        {
            return _repository.Where(expression);
        }

        private void SetLastModifier(T entity)
        {
            var user = _httpContextAccessor?.HttpContext?.User;

            if (user is { Identity: { IsAuthenticated: true } })
            {
                var userId = user.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)
                    ?.Value;
                var prop = entity.GetType().GetProperty("LastModifier");
                prop?.SetValue(entity, userId);
            }
        }
    }
}