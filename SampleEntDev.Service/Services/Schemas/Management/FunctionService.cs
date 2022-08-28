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
    public class FunctionService : GenericService<Functions>, IFunctionService
    {
        private readonly IFunctionRepository _functionRepository;
        private readonly IMapper _mapper;

        public FunctionService(IGenericRepository<Functions> repository, IUnitOfWork unitOfWork,
            IFunctionRepository functionRepository, IMapper mapper, IHttpContextAccessor httpContextAccessor) : base(
            repository, unitOfWork, httpContextAccessor)
        {
            _functionRepository = functionRepository;
            _mapper = mapper;
        }

        public async Task<GResponseDto<FunctionDto>> GetUserAuthorizedFunctions(int userId, string? actionName,
            string? controllerName, string? areaName = null)
        {
            var authorizedMethods =
                await _functionRepository.GetUserAuthorizedFunctions(userId, actionName, controllerName, areaName);
            var data = _mapper.Map<FunctionDto>(authorizedMethods);
            if (data == null) return GResponseDto<FunctionDto>.Fail(401, "Unuthorized");
            return data.Id > 0
                ? GResponseDto<FunctionDto>.Success(200, data)
                : GResponseDto<FunctionDto>.Fail(401, "Unuthorized");
        }

        public async Task<GResponseDto<List<FunctionDto>>> GetUserAuthorizedFunctions(int userId)
        {
            var authorizedMethods = await _functionRepository.GetUserAuthorizedFunctions(userId);
            var data = _mapper.Map<IEnumerable<FunctionDto>>(authorizedMethods);
            if (data == null) return GResponseDto<List<FunctionDto>>.Fail(401, "Unuthorized");
            return data.Any(x => x.Id > 0)
                ? GResponseDto<List<FunctionDto>>.Success(200, data.ToList())
                : GResponseDto<List<FunctionDto>>.Fail(401, "Unuthorized");
        }
    }
}