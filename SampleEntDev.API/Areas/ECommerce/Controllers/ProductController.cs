using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Services;
using SampleEntDev.Core.Services.Schemas.ECommerce;
using SampleEntDev.Service.Services.Schemas.ECommerce;

namespace SampleEntDev.API.Areas.ECommerce.Controllers
{
    [Area("ECommerce")]
   
    public class ProductController : BaseController
    {
        private readonly IMapper _mapper;
        //private readonly IGenericService<Product> _service;
        private readonly IProductService _productService;

        public ProductController(IProductService productService, IMapper mapper)
        {
            _productService = productService;
            _mapper = mapper;
        }

        // GET api/<ProductController>/GetProductsWithCategory
        [HttpGet("[action]")]
        public async Task<IActionResult> GetProductsWithCategory()
        {
            return CreateActionResult(await _productService.GetProductWithCategory());
        }

        // GET: api/<ProductController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var p = await _productService.GetAllAsync();
            var pDto = _mapper.Map<List<ProductDto>>(p);
            return CreateActionResult(GResponseDto<List<ProductDto>>.Success(200, pDto));
            
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetAsync(int id)
        {
            var p = await _productService.GetByIdAsync(id);
            var pDto= _mapper.Map<ProductDto>(p);
            return CreateActionResult(GResponseDto<ProductDto>.Success(200, pDto));

        }

        // POST api/<ProductController>
        [HttpPost]
        public async Task<IActionResult> Post(ProductDto pDto)
        {
            var p = await _productService.AddAsync(_mapper.Map<Product>(pDto));
            var savedProduct=_mapper.Map<ProductDto>(p);
            return CreateActionResult(GResponseDto<ProductDto>.Success(201, savedProduct));
        }

        [HttpPut]
        public async Task<IActionResult> Put(ProductUpdateDto pDto)
        {
            await _productService.UpdateAsync(_mapper.Map<Product>(pDto));
            return CreateActionResult(GResponseDto<NoContentDto>.Success(204));
        }

        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> RemoveAsync(int id)
        {
            var p = await _productService.GetByIdAsync(id);
            await _productService.RemoveAsync(p);
            return CreateActionResult(GResponseDto<NoContentDto>.Success(204));
        }
    }
}
