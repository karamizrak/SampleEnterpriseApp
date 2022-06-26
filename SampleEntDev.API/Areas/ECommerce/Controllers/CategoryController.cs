using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.API.Filter;
using SampleEntDev.Core.Services.Schemas.ECommerce;

namespace SampleEntDev.API.Areas.ECommerce.Controllers
{
    [Area("ECommerce")]
    //[ValidateFilter]
    public class CategoryController : BaseController
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetSingleCategoryByIdWithProducts(int categoryId)
        {
            return CreateActionResult(await _categoryService.GetSingleCategoryByIdWithProductsAsnyc(categoryId));
        }
    }
}
