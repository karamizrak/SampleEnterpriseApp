using Microsoft.AspNetCore.Mvc;
using SampleEntDev.Core.Dtos;

namespace SampleEntDev.API.Controllers
{
    [Route("api/[area]/[controller]")]
    [ApiController]

    public class BaseController : Controller
    {
        public BaseController()
        {

        }
        [NonAction] //swagger bunu dışarı göstermemesi için
       public IActionResult CreateActionResult<T>(GResponseDto<T> response) where T : class
        {
            if(response.StatusCode == 204)
            {
                return new ObjectResult(null)
                {
                    StatusCode = response.StatusCode
                };
            }
            return new ObjectResult(response)
            {
                StatusCode = response.StatusCode
            };
        }
    }
}
