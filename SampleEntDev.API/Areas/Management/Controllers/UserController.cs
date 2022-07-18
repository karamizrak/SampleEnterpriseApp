using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Areas.Management.Controllers
{
    [Area("Managemenet")]
    public class UserController : GControllers<UserDto, Core.Entities.Schemas.Users>
    {
        public UserController(IMapper mapper, IGenericService<Core.Entities.Schemas.Users> service) : base(mapper,
            service)
        {
        }
    }
}