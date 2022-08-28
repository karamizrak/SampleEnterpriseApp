using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Test:IEntity
    {
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string? Ad { get; set; }
        public string? Soyad { get; set; }
        public bool? IsDeleted { get; set; }
        public string? LastModifier { get; set; }
    }
}
