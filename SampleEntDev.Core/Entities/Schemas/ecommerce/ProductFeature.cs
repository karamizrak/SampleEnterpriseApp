using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace SampleEntDev.Core.Entities.Schemas
{
    [Table("product_feature", Schema = "ecommerce")]
    public partial class ProductFeature
    {
        [Column("color")]
        public string? Color { get; set; }
        [Column("height")]
        public int? Height { get; set; }
        [Column("width")]
        public int? Width { get; set; }
        [Key]
        [Column("product_id")]
        public int ProductId { get; set; }

        [ForeignKey(nameof(ProductId))]
        [InverseProperty("ProductFeature")]
        public virtual Product Product { get; set; } = null!;
    }
}
