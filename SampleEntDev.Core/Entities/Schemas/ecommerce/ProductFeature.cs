using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class ProductFeature:IBaseEntity
    {
        public string? Color { get; set; }
        public int? Height { get; set; }
        public int? Width { get; set; }
        public int ProductId { get; set; }

        public virtual Product Product { get; set; } = null!;
    }
}
