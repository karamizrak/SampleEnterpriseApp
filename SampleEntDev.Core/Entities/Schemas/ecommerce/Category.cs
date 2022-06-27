using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Category:IBaseEntity
    {
        public Category()
        {
            Product = new HashSet<Product>();
        }

        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int Id { get; set; }

        public virtual ICollection<Product> Product { get; set; }
    }
}
