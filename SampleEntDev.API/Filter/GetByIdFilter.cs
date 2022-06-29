using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Entities;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Filter
{
    /// <summary>
    /// To use this filter, the controller must derive from "BaseController" and actions used with the "Id" parameter will be overwritten. And the desired data is returned in the "DefaultData" property in the action.
    /// </summary>
    /// <typeparam name="TEntity">Entity tipi</typeparam>
    /// <typeparam name="TModel">Dönüştürülecek Model tipi</typeparam>
    public class GetByIdFilter<TEntity, TDto> : IAsyncActionFilter where TEntity : class, IEntity where TDto : class, IDto
    {
        private readonly IGenericService<TEntity> _service;
        private readonly IMapper _mapper;

        public GetByIdFilter(IGenericService<TEntity> service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var idValue = context.ActionArguments.Values.FirstOrDefault();
            if (idValue == null)
            {
                await next.Invoke();
                return;
            }

            var id = (int)idValue;
            var entity = await _service.GetByIdAsync(id);
            if (entity == null)
            {
                context.Result = new NotFoundObjectResult(GResponseDto<NoContentDto>.Fail(404, $"{typeof(TDto).Name} ({id}) not found."));
            }
            else
            {
                var data = _mapper.Map<TDto>(entity);
                context.HttpContext.Items.Add("model",  data);
                await next();
            }
        }
    }
}
