using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Controllers;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Areas.User
{
    [Area("Managemenet")]
    public class UserController : GControllers<UserDto,Core.Entities.Schemas.User>
    {
        public UserController(IMapper mapper, IGenericService<Core.Entities.Schemas.User> service) : base(mapper, service)
        {
        }
    }
}
