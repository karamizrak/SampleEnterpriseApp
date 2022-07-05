using Microsoft.Extensions.Options;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Security;
using SampleEntDev.Core.Services.Schemas.Management;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Service.Services.Schemas.Management
{
    public class AuthService: IAuthService
    {
        private readonly IUserService _userService;
        private readonly ITokenHandler _tokenHandler;
        private readonly TokenOptions _tokenOptions;

        public AuthService(IUserService userService, ITokenHandler tokenHandler, IOptions<TokenOptions> tokenOption)
        {
            _userService = userService;
            _tokenHandler = tokenHandler;
            _tokenOptions = tokenOption.Value;
        }

        public async Task<GResponseDto<AccessToken>> CreateAccessToken(string email, string password)
        {
            var user = await _userService.FindByEmailandPassword(email, password);
            if (user != null && user.StatusCode==200)
            {
                var accessToken = _tokenHandler.CreateAccessToken(user.Data);
                await _userService.SaveRefreshToken(user.Data.Id, accessToken.RefreshToken, DateTime.Now.AddSeconds(_tokenOptions.RefreshTokenExpiration));
               return GResponseDto<AccessToken>.Success(200, accessToken);
            }
            return GResponseDto<AccessToken>.Fail(404, "Not found user. Check the information you have entered.");
            
        }

        public async Task<GResponseDto<AccessToken>> CreateAccessTokenByRefreshToken(string refreshToken)
        {
            var userRefreshToken = await _userService.GetUserByRefreshToken(refreshToken);
            if (userRefreshToken.StatusCode==200)
            {
                if (userRefreshToken?.Data?.RefreshTokenEndDate > DateTime.Now)
                {
                    var accessToken = _tokenHandler.CreateAccessToken(userRefreshToken.Data);
                    await _userService.SaveRefreshToken(userRefreshToken.Data.Id, accessToken.RefreshToken, DateTime.Now.AddSeconds(_tokenOptions.RefreshTokenExpiration));
                    return GResponseDto<AccessToken>.Success(200, accessToken);
                }
                else
                {
                    return GResponseDto<AccessToken>.Fail(403, "The Refresh Token has expired. You must login again.");
                }
            }
            else
            {
                return GResponseDto<AccessToken>.Fail(404, "Not found user.");
                
            }
        }

        public async Task<GResponseDto<NoContentDto>> RemoveRefreshToken(string refreshToken)
        {
            var userResponse = await _userService.GetUserByRefreshToken(refreshToken);
            if (userResponse.StatusCode==200)
            {
                await _userService.RemoveRefreshToken(userResponse.Data.Id);
                return GResponseDto<NoContentDto>.Success(204);
            }
            else
            {
                return GResponseDto<NoContentDto>.Fail(404, "Not found refresh token.");
                
            }
        }
    }
}
