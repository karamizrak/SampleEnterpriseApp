using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace SampleEntDev.Core.Entities.Schemas
{
    [Table("product", Schema = "ecommerce")]
    public partial class Product
    {
        [Column("created_date", TypeName = "timestamp without time zone")]
        public DateTime CreatedDate { get; set; }
        [Column("updated_date", TypeName = "timestamp without time zone")]
        public DateTime? UpdatedDate { get; set; }
        [Column("name")]
        public string? Name { get; set; }
        [Column("stock")]
        public int? Stock { get; set; }
        [Column("price")]
        public float? Price { get; set; }
        [Column("category_id")]
        public int? CategoryId { get; set; }
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [ForeignKey(nameof(CategoryId))]
        [InverseProperty("Product")]
        public virtual Category? Category { get; set; }
        [InverseProperty("Product")]
        public virtual ProductFeature ProductFeature { get; set; } = null!;
    }
}
