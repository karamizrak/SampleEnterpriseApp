using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.ECommerce
{
    public class ProductFeatureDto:IDto
    {
        [Display(Name = "Color")]
        public string? Color { get; set; }
        [Display(Name = "Height")]
        public int? Height { get; set; }
        [Display(Name = "Width")]
        public int? Width { get; set; }
        public int ProductId { get; set; }

    }
}
