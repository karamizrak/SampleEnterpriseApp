using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.Management
{
    public class UserToRoleDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public DateTime? ValidityPeriodStartTime { get; set; }
        public DateTime? ValidityPeriodEndTime { get; set; }
        public RoleDto Role { get; set; } = null!;
        public UserDto User { get; set; } = null!;
    }
}