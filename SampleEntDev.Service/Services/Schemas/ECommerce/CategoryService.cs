using AutoMapper;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Service.Services.Schemas.ECommerce
{
    public class CategoryService : GenericService<Category>, ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IMapper _mapper;
        public CategoryService(IGenericRepository<Category> repository, IUnitOfWork unitOfWork, ICategoryRepository categoryRepository, IMapper mapper) : base(repository, unitOfWork)
        {
            _categoryRepository = categoryRepository;
            _mapper = mapper;
        }

        public async Task<GResponseDto<CategoryWithProductsDto>> GetSingleCategoryByIdWithProductsAsnyc(int categoryId)
        {
            var c = await _categoryRepository.GetSingleCategoryByIdWithProductsAsnyc(categoryId);
            var cDto = _mapper.Map<CategoryWithProductsDto>(c);
            return GResponseDto<CategoryWithProductsDto>.Success(200, cDto);
        }
    }
}
