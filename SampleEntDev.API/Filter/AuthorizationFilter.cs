using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Formatters;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Services;
using SampleEntDev.Core.Services.Schemas.Management;

namespace SampleEntDev.API.Filter
{
    public class CustomAuthorizationAttribute : AuthorizeAttribute, IAuthorizationFilter
    {
        private readonly IFunctionService _functionService;

        public CustomAuthorizationAttribute(IFunctionService functionService)
        {
            _functionService = functionService;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            if (!CheckUserPermission(context))
                context.Result =
                    new JsonResult(GResponseDto<NoContentDto>.Fail(401, "You don't have access to this function."))
                        { StatusCode = 401, ContentType = "application/json" };
        }

        private bool CheckUserPermission(ActionContext context)
        {
            var user = context.HttpContext.User;
            if (user.Identity is not { IsAuthenticated: true }) return false;
            var userTmpId = user.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)
                ?.Value;
            if (string.IsNullOrWhiteSpace(userTmpId) || !int.TryParse(userTmpId, out var userId)) return false;
            var area = context.RouteData.Values["area"]?.ToString();
            var controller = context.RouteData.Values["controller"]?.ToString();
            var action = context.RouteData.Values["action"]?.ToString();
            var authorizedFunction =
                _functionService.GetUserAuthorizedFunctions(userId, action, controller, area).Result;
            return authorizedFunction is { StatusCode: 200, Data.Id: > 0 };
        }
    }
}