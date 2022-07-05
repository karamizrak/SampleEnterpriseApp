using System;
using System.Collections.Generic;

namespace SampleEntDev.Core.Entities.Schemas
{
    public partial class UserToRoles:IEntity
    {
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int Id { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public DateTime? ValidityPeriodStartTime { get; set; }
        public DateTime? ValidityPeriodEndTime { get; set; }
    }
}
