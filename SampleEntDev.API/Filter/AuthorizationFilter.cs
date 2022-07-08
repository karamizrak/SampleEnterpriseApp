using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using SampleEntDev.Core.Services;

namespace SampleEntDev.API.Filter
{
    public class GsbAuthorizationAttribute: AuthorizeAttribute, IAuthorizationFilter
    {
        //private readonly IGenericService<> _authorizationService;
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var user = context.HttpContext.User;
            if (user.Identity.IsAuthenticated)
            {
                var userId = user.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
                if (!string.IsNullOrWhiteSpace(userId))
                {
                    var area = context.RouteData.Values["area"];
                    var controller= context.RouteData.Values["controller"];
                    var action = context.RouteData.Values["action"];


                }
            }
            context.Result = new UnauthorizedResult();
        }
    }
}
