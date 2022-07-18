using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class RoleToFunctions:IEntity
    {
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public int RoleId { get; set; }
        public int FunctionId { get; set; }

        public virtual Functions Function { get; set; } = null!;
        public virtual Roles Role { get; set; } = null!;
    }
}
