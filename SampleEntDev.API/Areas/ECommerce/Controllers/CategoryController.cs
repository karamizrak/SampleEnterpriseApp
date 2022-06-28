﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.API.Filter;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;
using SampleEntDev.Core.Services.Schemas.ECommerce;

namespace SampleEntDev.API.Areas.ECommerce.Controllers
{
    [Area("ECommerce")]
    //[ValidateFilter]
    public class CategoryController : BaseController
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;

        public CategoryController(ICategoryService categoryService, IMapper mapper)
        {
            _categoryService = categoryService;
            _mapper = mapper;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var cat = await _categoryService.GetAllAsync();
            var catDto = _mapper.Map<List<CategoryDto>>(cat.ToList());
            return CreateActionResult(GResponseDto<List<CategoryDto>>.Success(200, catDto));

        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetSingleCategoryByIdWithProducts(int categoryId)
        {
            return CreateActionResult(await _categoryService.GetSingleCategoryByIdWithProductsAsnyc(categoryId));
        }
    }
}
