using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Repositories.Schemas.Management;
using SampleEntDev.Core.Services.Schemas.Management;

namespace SampleEntDev.Service.Services.Schemas.Management
{
    public class RoleService : GenericService<Roles>, IRoleService
    {
        private readonly IRoleRepository _roleRepository;
        private readonly IMapper _mapper;

        public RoleService(IGenericRepository<Roles> repository, IUnitOfWork unitOfWork, IRoleRepository roleRepository,
            IMapper mapper, IHttpContextAccessor httpContextAccessor) : base(repository, unitOfWork,
            httpContextAccessor)
        {
            _roleRepository = roleRepository;
            _mapper = mapper;
        }

        public async Task<GResponseDto<List<RoleDto>>> GetUserAuthorizedRoles(int userId)
        {
            var roles = await _roleRepository.GetUserAuthorizedRoles(userId);
            var data = _mapper.Map<List<RoleDto>>(roles);

            if (data == null) return GResponseDto<List<RoleDto>>.Fail(401, "Unuthorized");
            return data.Any(x => x.Id > 0)
                ? GResponseDto<List<RoleDto>>.Success(200, data)
                : GResponseDto<List<RoleDto>>.Fail(401, "Unuthorized");
        }

        public async Task<GResponseDto<List<RoleDto>>> GetRolesFromFunctionByUserId(int userId, string? actionName,
            string? controllerName,
            string? areaName)
        {
            var roles = await _roleRepository.GetRolesFromFunctionByUserId(userId, actionName, controllerName,
                areaName);
            var data = _mapper.Map<List<RoleDto>>(roles);
            if (data == null) return GResponseDto<List<RoleDto>>.Fail(401, "Unuthorized");
            return data.Any(x => x.Id > 0)
                ? GResponseDto<List<RoleDto>>.Success(200, data)
                : GResponseDto<List<RoleDto>>.Fail(401, "Unuthorized");
        }
    }
}