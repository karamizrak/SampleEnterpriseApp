using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Roles:IEntity
    {
        public Roles()
        {
            RoleToFunctions = new HashSet<RoleToFunctions>();
        }

        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string RoleName { get; set; } = null!;

        public virtual ICollection<RoleToFunctions> RoleToFunctions { get; set; }
    }
}
