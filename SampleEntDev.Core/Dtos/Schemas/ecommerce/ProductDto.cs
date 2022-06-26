using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.ecommerce
{
    public class ProductDto:BaseDto,IDto
    {
        [Display(Name = "Name")]
        public string  Name { get; set; }
        [Display(Name = "Price")]
        public int Price { get; set; }
        [Display(Name = "Stock")]
        public int Stock { get; set; }
        public int CategoryId { get; set; }
        
    }
}
