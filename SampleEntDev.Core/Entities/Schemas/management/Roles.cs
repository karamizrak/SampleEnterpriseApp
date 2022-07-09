using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Roles:IEntity
    {
        public Roles()
        {
            RoleToFunctions = new HashSet<RoleToFunctions>();
            UserToRoles = new HashSet<UserToRoles>();
        }

        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string RoleName { get; set; } = null!;

        public virtual ICollection<RoleToFunctions> RoleToFunctions { get; set; }
        public virtual ICollection<UserToRoles> UserToRoles { get; set; }
    }
}
