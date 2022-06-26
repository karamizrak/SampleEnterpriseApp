using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.ecommerce;
using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Services.Schemas.ECommerce
{
    public interface IProductService:IGenericService<Product>
    {
        Task<GResponseDto<List<ProductWithCategoryDto>>> GetProductWithCategory();
    }
}
