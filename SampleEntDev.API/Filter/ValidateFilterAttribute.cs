using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SampleEntDev.Core.Dtos;
using System.Diagnostics.CodeAnalysis;

namespace SampleEntDev.API.Filter
{

    public class ValidateFilterAttribute:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if(!context.ModelState.IsValid)
            {
                var errors = context.ModelState.Values.SelectMany(x=> x.Errors).Select(x=>x.ErrorMessage).ToList();
                //errors.ToList().ForEach(x=> x.ErrorMessage)

                context.Result=new BadRequestObjectResult(GResponseDto<NoContentDto>.Fail(400,errors));
            }
        }
    }
}
