using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.ecommerce
{
    public class CategoryWithProductsDto:CategoryDto
    {
        public List<ProductDto> Product { get; set; }
    }
}
