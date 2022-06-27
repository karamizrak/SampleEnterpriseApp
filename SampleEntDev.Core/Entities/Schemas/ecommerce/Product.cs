using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Product:IBaseEntity
    {
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string? Name { get; set; }
        public int Stock { get; set; }
        public float Price { get; set; }
        public int? CategoryId { get; set; }
        public int Id { get; set; }

        public virtual Category? Category { get; set; }
        public virtual ProductFeature ProductFeature { get; set; } = null!;
    }
}
