using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;

namespace SampleEntDev.Core.Services.Schemas.Management
{
    public interface IRoleService : IGenericService<Roles>
    {
        Task<GResponseDto<List<RoleDto>>> GetUserAuthorizedRoles(int userId);

        Task<GResponseDto<List<RoleDto>>> GetRolesFromFunctionByUserId(int userId, string? actionName,
            string? controllerName,
            string? areaName);
    }
}