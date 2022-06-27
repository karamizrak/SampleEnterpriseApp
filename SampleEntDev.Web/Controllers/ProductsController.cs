using Microsoft.AspNetCore.Mvc;
using SampleEntDev.Core.Services.Schemas.ECommerce;

namespace SampleEntDev.Web.Controllers
{
    public class ProductsController : Controller
    {
        private readonly IProductService productService;

        public ProductsController(IProductService productService)
        {
            this.productService = productService;
        }

        public async Task<IActionResult> Index()
        {
            var model = await productService.GetProductWithCategory();
            return View(model.Data);
        }
    }
}
