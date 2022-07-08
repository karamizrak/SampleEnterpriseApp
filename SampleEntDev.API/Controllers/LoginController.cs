using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleEntDev.API.Extensions;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Services.Schemas.Management;




namespace SampleEntDev.API.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IAuthService _authenticationService;

        private readonly IUserService _userService;

        public LoginController(IUserService userService, IAuthService authenticationService)
        {
            _userService = userService;
            _authenticationService = authenticationService;
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult AccessToken(LoginDto loginDto)
        {

            if (ModelState.IsValid)
            {
                var user = _authenticationService.CreateAccessToken(loginDto.email, loginDto.password).Result;
                if (user.StatusCode == 200)
                    return Ok(user);
                else
                    return NotFound("Not found user.");
            }
            else
            {
                return BadRequest(ModelState);
            }

        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult RefreshToken(RefreshTokenDto refreshTokenDto)
        {

            var accessToken = _authenticationService.CreateAccessTokenByRefreshToken(refreshTokenDto.RefreshToken).Result;
            if (accessToken.StatusCode == 200)
                return Ok(accessToken);
            else
                return NotFound(refreshTokenDto);


        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult RemoveRefreshToken(RefreshTokenDto refreshTokenDto)
        {

            var accessToken = _authenticationService.RemoveRefreshToken(refreshTokenDto.RefreshToken).Result;

            if (accessToken.StatusCode == 200)
                return Ok(accessToken);
            else
                return NotFound(refreshTokenDto);


        }
    }
}
