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
    public interface IFunctionService : IGenericService<Functions>
    {
        Task<GResponseDto<List<FunctionDto>>> GetUserAuthorizedFunctions(int userId);

        Task<GResponseDto<FunctionDto>> GetUserAuthorizedFunctions(int userId, string? actionName,
            string? controllerName, string? areaName = null);
    }
}