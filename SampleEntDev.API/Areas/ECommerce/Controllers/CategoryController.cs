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
using SampleEntDev.Service.Services.Schemas.ECommerce;

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
        // GET api/<CategoryController>/5
        [HttpGet]
        [SkipAuthorization]
        public async Task<IActionResult> GetAsync(int id)
        {
            throw new Exception("Olmadı2");
            return await Task.FromResult(CreateActionResult(GResponseDto<CategoryDto>.Success(200, DefaultData)));
        }

        // POST api/<CategoryController>
        [HttpPost]
        public async Task<IActionResult> Post(CategoryDto pDto)
        {
            var p = await _categoryService.AddAsync(_mapper.Map<Category>(pDto));
            var savedCategory = _mapper.Map<CategoryDto>(p);
            return CreateActionResult(GResponseDto<CategoryDto>.Success(201, savedCategory));
        }
    }
}