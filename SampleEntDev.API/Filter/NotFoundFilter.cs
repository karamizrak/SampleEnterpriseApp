using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Entities;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Filter
{
    public class NotFoundFilter<T> : IAsyncActionFilter where T : class, IEntity
    {

        private readonly IGenericService<T> _service;

        public NotFoundFilter(IGenericService<T> service)
        {
            _service = service;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var idValue = context.ActionArguments.Values.FirstOrDefault();
            if(idValue==null)
            {
                await next.Invoke();
                return;
            }

            var id = (int)idValue;
            var hasEntity=await _service.GetByIdAsync(id);
            if(hasEntity!=null)
            {
                await next.Invoke();
                return;
            }

            context.Result = new NotFoundObjectResult(GResponseDto<NoContentDto>.Fail(404, $"{typeof(T).Name} ({id}) not found."));
        }
    }
}
