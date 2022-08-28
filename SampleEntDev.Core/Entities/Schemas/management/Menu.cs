using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Menu:IEntity
    {
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public string? Url { get; set; }
        public int? ParentId { get; set; }
        public string? IconPath { get; set; }
        public int? FunctionId { get; set; }
        public bool? IsDeleted { get; set; }
        public string? LastModifier { get; set; }

        public virtual Functions? Function { get; set; }
    }
}
