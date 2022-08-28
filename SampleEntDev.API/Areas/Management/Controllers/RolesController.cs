using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Areas.Management.Controllers
{
    [Area("Managemenet")]
    public class RolesController : GControllers<RoleDto, Core.Entities.Schemas.Roles>
    {
        public RolesController(IMapper mapper, IGenericService<Roles> service) : base(mapper, service)
        {
        }
    }
}