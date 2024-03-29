﻿using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class Functions:IEntity
    {
        public Functions()
        {
            Menu = new HashSet<Menu>();
            RoleToFunctions = new HashSet<RoleToFunctions>();
            UserToFuncitons = new HashSet<UserToFuncitons>();
        }

        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public string FunctionName { get; set; } = null!;
        public string? AreaName { get; set; }
        public string ControllerName { get; set; } = null!;
        public string ActionName { get; set; } = null!;
        public bool? IsDeleted { get; set; }
        public string? LastModifier { get; set; }

        public virtual ICollection<Menu> Menu { get; set; }
        public virtual ICollection<RoleToFunctions> RoleToFunctions { get; set; }
        public virtual ICollection<UserToFuncitons> UserToFuncitons { get; set; }
    }
}
