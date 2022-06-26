using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.ecommerce
{
    public  class ProductWithCategoryDto:ProductDto
    {
        public CategoryDto Category { get; set; }
    }
}
