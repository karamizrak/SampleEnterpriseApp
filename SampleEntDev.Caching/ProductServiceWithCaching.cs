using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ECommerce;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using SampleEntDev.Service.Exceptions;
using System.Linq.Expressions;

namespace SampleEntDev.Caching
{
    public class ProductServiceWithCaching : IProductService
    {
        private const string CacheProductKey = "productCache";
        private readonly IMapper _mapper;
        private readonly IMemoryCache _memoryCache;
        private readonly IProductRepository _productRepository;
        private readonly IUnitOfWork _unitOfWork;


        public ProductServiceWithCaching(IMapper mapper, IMemoryCache memoryCache, IProductRepository productRepository, IUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _memoryCache = memoryCache;
            _productRepository = productRepository;
            _unitOfWork = unitOfWork;

            if(!_memoryCache.TryGetValue(CacheProductKey,out _)) // _ Don't allocate space. I just want to check that it is.
            {
                _memoryCache.Set(CacheProductKey, _productRepository.GetProductWithCategory().Result);
            }
        }


        public async Task<Product> AddAsync(Product entity)
        {
            await _productRepository.AddAsync(entity);
            await _unitOfWork.CommitAsync();
            await CacheAllProductsAsync();
            return entity;
        }

        public async Task<IEnumerable<Product>> AddRangeAsync(IEnumerable<Product> entities)
        {
            await _productRepository.AddRangeAsync(entities);
            await _unitOfWork.CommitAsync();
            await CacheAllProductsAsync();
            return entities;
        }

        public Task<bool> AnyAsync(Expression<Func<Product, bool>> expression)
        {
            return Task.FromResult(_memoryCache.Get<IEnumerable<Product>>(CacheProductKey).Any(expression.Compile()));
        }

        public Task<IEnumerable<Product>> GetAllAsync()
        {
            return Task.FromResult(_memoryCache.Get<IEnumerable<Product>>(CacheProductKey));
        }

        public Task<IEnumerable<Product>> GetAllAsync(Expression<Func<Product, bool>> expression)
        {
            return Task.FromResult(_memoryCache.Get<IEnumerable<Product>>(CacheProductKey).Where(expression.Compile()));
        }

        public Task<Product> GetByIdAsync(int id)
        {
            var p = _memoryCache.Get<List<Product>>(CacheProductKey).FirstOrDefault(x => x.Id == id);
            if(p == null)
                throw new NotFoundException($"{typeof(Product).Name} does not exist");

            return Task.FromResult(p);
        }

        public  Task<GResponseDto<List<ProductWithCategoryDto>>> GetProductWithCategory()
        {
            var p = _memoryCache.Get<IEnumerable<Product>>(CacheProductKey);
            var pWithCategory = _mapper.Map<List<ProductWithCategoryDto>>(p);
            return Task.FromResult(  GResponseDto<List<ProductWithCategoryDto>>.Success(200, pWithCategory));
        }

        public async Task RemoveAsync(Product entity)
        {
            _productRepository.Remove(entity);
            await _unitOfWork.CommitAsync();
            await CacheAllProductsAsync();
        }

        public async Task RemoveRangeAsync(IEnumerable<Product> entities)
        {
            _productRepository.RemoveRange(entities);
            await _unitOfWork.CommitAsync();
            await CacheAllProductsAsync();
        }

        public async Task UpdateAsync(Product entity)
        {
            _productRepository.Update(entity);
            await _unitOfWork.CommitAsync();
            await CacheAllProductsAsync();

        }

        public IQueryable<Product> Where(Expression<Func<Product, bool>> expression)
        {
            return _memoryCache.Get<List<Product>>(CacheProductKey).Where(expression.Compile()).AsQueryable();
        }


    public async Task CacheAllProductsAsync()
        {
            await _memoryCache.Set(CacheProductKey, _productRepository.GetAll().ToListAsync());
        }
    }
}