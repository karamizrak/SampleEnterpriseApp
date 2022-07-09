using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Filter;
using SampleEntDev.Core.Dtos;

namespace SampleEntDev.API.Controllers
{
    [Route("api/[area]/[controller]")]
    [ApiController]
    [ServiceFilter(typeof(CustomAuthorizationAttribute))]
    public class BaseController<TDefaultModel> : ControllerBase where TDefaultModel : class
    {
        public BaseController()
        {
        }


        protected TDefaultModel DefaultData
        {
            get
            {
                var tmpModel = HttpContext?.Items.FirstOrDefault(x => ReferenceEquals(x.Key, "model"));
                return tmpModel?.Value as TDefaultModel;

                //;
            }
            set
            {
                if (value == null) throw new ArgumentNullException(nameof(value));
            }
        }

        [NonAction] //swagger bunu dışarı göstermemesi için
        public IActionResult CreateActionResult<T>(GResponseDto<T> response) where T : class
        {
            if (response.StatusCode == 204)
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