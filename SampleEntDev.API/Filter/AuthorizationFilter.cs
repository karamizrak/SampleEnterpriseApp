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
        private readonly IRoleService _roleService;

        public CustomAuthorizationAttribute(IFunctionService functionService, IRoleService roleService)
        {
            _functionService = functionService;
            _roleService = roleService;
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

            var authorizedFromRoles =
                _roleService.GetRolesFromFunctionByUserId(userId, action, controller, area).Result;
            if (authorizedFromRoles.StatusCode != 200)
            {
                var authorizedFunction =
                    _functionService.GetUserAuthorizedFunctions(userId, action, controller, area).Result;
                return authorizedFunction.StatusCode == 200;
            }

            return authorizedFromRoles.StatusCode == 200;
        }
    }
}