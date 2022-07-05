using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Services.Schemas.Management;




namespace SampleEntDev.API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController : BaseController<LoginDto>
    {
        private readonly IAuthService _authenticationService;

        private readonly IUserService _userService;

        public LoginController(IUserService userService, IAuthService authenticationService)
        {
            _userService = userService;
            _authenticationService = authenticationService;
        }

        [HttpPost]
        public IActionResult AccessToken(LoginDto loginDto)
        {

            if (ModelState.IsValid)
            {
                var user = _authenticationService.CreateAccessToken(loginDto.email, loginDto.password).Result;
                return CreateActionResult(user);
            }
            else
            {
                return CreateActionResult<NoContentDto>(GResponseDto<NoContentDto>.Fail(400, $"Bad Request."));
            }

        }

        [HttpPost]
        public IActionResult RefreshToken(RefreshTokenDto refreshTokenDto)
        {

            var accessToken = _authenticationService.CreateAccessTokenByRefreshToken(refreshTokenDto.RefreshToken).Result;
            return CreateActionResult(accessToken);

      
        }

        [HttpPost]
        public IActionResult RemoveRefreshToken(RefreshTokenDto refreshTokenDto)
        {

            var accessToken = _authenticationService.RemoveRefreshToken(refreshTokenDto.RefreshToken).Result;

            return CreateActionResult(accessToken);

    
        }
    }
}
