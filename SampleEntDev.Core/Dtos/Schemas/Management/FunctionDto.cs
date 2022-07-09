using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Dtos.Schemas.Management
{
    public class FunctionDto : IDto
    {
        public FunctionDto()
        {
            RoleToFunctions = new List<RoleToFunctionDto>();
            UserToFuncitons = new List<UserToFuncitonDto>();
        }

        public int Id { get; set; }
        public string FunctionName { get; set; } = null!;

        public List<RoleToFunctionDto> RoleToFunctions { get; set; }
        public List<UserToFuncitonDto> UserToFuncitons { get; set; }
    }
}