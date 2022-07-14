using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.Management
{
    public class RoleDto
    {
        public RoleDto()
        {
            RoleToFunctions = new List<RoleToFunctionDto>();
            UserToRoles = new List<UserToRoleDto>();
        }


        public int Id { get; set; }
        public string RoleName { get; set; } = null!;

        public List<RoleToFunctionDto> RoleToFunctions { get; set; }
        public List<UserToRoleDto> UserToRoles { get; set; }
    }
}