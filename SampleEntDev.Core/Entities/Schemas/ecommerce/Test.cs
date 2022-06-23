using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace SampleEntDev.Core.Entities.Schemas
{
    [Table("test", Schema = "ecommerce")]
    public partial class Test
    {
        [Column("created_date", TypeName = "timestamp without time zone")]
        public DateTime CreatedDate { get; set; }
        [Column("updated_date", TypeName = "timestamp without time zone")]
        public DateTime? UpdatedDate { get; set; }
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("ad", TypeName = "character varying")]
        public string? Ad { get; set; }
        [Column("soyad", TypeName = "character varying")]
        public string? Soyad { get; set; }
    }
}
