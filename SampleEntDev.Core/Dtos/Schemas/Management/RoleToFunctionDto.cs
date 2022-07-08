using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.Management
{
    public class RoleToFunctionDto
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public int FunctionId { get; set; }

        public FunctionDto Function { get; set; } = null!;
        public RoleDto Role { get; set; } = null!;
    }
}
