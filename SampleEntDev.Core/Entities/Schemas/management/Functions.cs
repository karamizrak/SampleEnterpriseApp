using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Functions:IEntity
    {
        public Functions()
        {
            RoleToFunctions = new HashSet<RoleToFunctions>();
            UserToFuncitons = new HashSet<UserToFuncitons>();
        }

        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string FuntionName { get; set; } = null!;

        public virtual ICollection<RoleToFunctions> RoleToFunctions { get; set; }
        public virtual ICollection<UserToFuncitons> UserToFuncitons { get; set; }
    }
}
