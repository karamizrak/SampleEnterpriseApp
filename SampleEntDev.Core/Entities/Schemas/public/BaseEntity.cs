using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace SampleEntDev.Core.Entities
{
    public partial class BaseEntity
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column(TypeName = "timestamp without time zone")]
        public DateTime CreatedDate { get; set; }
        [Column("updated_date", TypeName = "timestamp without time zone")]
        public DateTime? UpdatedDate { get; set; }
    }
}
