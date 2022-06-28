using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;
using SampleEntDev.Web.Services;

namespace SampleEntDev.Web.Controllers
{


    public class ProductController : Controller
    {
        private readonly ProductApiService _productApiService;
        private readonly CategoryApiService _categoryApiService;

        public ProductController(CategoryApiService categoryApiService, ProductApiService productApiService)
        {
            _categoryApiService = categoryApiService;
            _productApiService = productApiService;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _productApiService.GetProductWithCategoryAsync());
        }

        public async Task<IActionResult> Save()
        {
            var cat = await _categoryApiService.GetAll();
            ViewBag.categories = new SelectList(cat, "Id", "Name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Save(ProductDto productDto)
        {
            if (ModelState.IsValid)
            {
                await _productApiService.Save(productDto);
                return RedirectToAction(nameof(Index));
            }
            var cat = await _categoryApiService.GetAll();
            ViewBag.categories = new SelectList(cat, "Id", "Name");
            return View(productDto);

        }

        public async Task<IActionResult> Update(int id)
        {
            var p = await _productApiService.GetBydId(id);
            var cat=await _categoryApiService.GetAll();
            ViewBag.categories = new SelectList(cat, "Id", "Name");
            return View(p);
        }
        [HttpPost]
        public async Task<IActionResult> Update(ProductDto productDto)
        {
            if (ModelState.IsValid)
            {
                await _productApiService.Update(productDto);
                return RedirectToAction(nameof(Index));
            }
            var cat = await _categoryApiService.GetAll();
            ViewBag.categories = new SelectList(cat, "Id", "Name");
            return View(productDto);

        }

        public async Task<IActionResult> Remove(int id)
        {
            await _productApiService.Remove(id);
            return RedirectToAction(nameof(Index));
        }


    }
}
