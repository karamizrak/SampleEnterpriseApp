using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.API.Filter;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ECommerce;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Services.Schemas.ECommerce;

namespace SampleEntDev.API.Areas.ECommerce.Controllers
{
    [Area("ECommerce")]
    //[ValidateFilter]
    public class CategoryController : BaseController<CategoryDto>
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;

        public CategoryController(ICategoryService categoryService, IMapper mapper)
        {
            _categoryService = categoryService;
            _mapper = mapper;
        }

        [HttpGet]
        [SkipAuthorization]
        public async Task<IActionResult> GetAll()
        {
            throw new Exception("Olmadı");
            var cat = await _categoryService.GetAllAsync();
            var catDto = _mapper.Map<List<CategoryDto>>(cat.ToList());
            return CreateActionResult(GResponseDto<List<CategoryDto>>.Success(200, catDto));
        }

        [HttpGet]
        public async Task<IActionResult> GetSingleCategoryByIdWithProducts(int categoryId)
        {
            return CreateActionResult(await _categoryService.GetSingleCategoryByIdWithProductsAsnyc(categoryId));
        }

        //[ServiceFilter(typeof(GetByIdFilter<Category, CategoryDto>))]
        // GET api/<ProductController>/5
        [HttpGet]
        [SkipAuthorization]
        public async Task<IActionResult> GetAsync(int id)
        {
            throw new Exception("Olmadı2");
            return await Task.FromResult(CreateActionResult(GResponseDto<CategoryDto>.Success(200, DefaultData)));
        }
    }
}