using Microsoft.Extensions.Options;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Security;
using SampleEntDev.Core.Services.Schemas.Management;
#if !DEBUG
using System.DirectoryServices.Protocols;
using System.Net;
#endif

namespace SampleEntDev.Service.Services.Schemas.Management
{
    public class AuthService : IAuthService
    {
        private readonly IUserService _userService;
        private readonly ITokenHandler _tokenHandler;
        private readonly TokenOptions _tokenOptions;
        private readonly LdapConfig _ldapConfig;

        public AuthService(IUserService userService, ITokenHandler tokenHandler, IOptions<TokenOptions> tokenOption, IOptions<LdapConfig> ldapConfig)
        {
            _userService = userService;
            _tokenHandler = tokenHandler;
            _tokenOptions = tokenOption.Value;
            _ldapConfig = ldapConfig.Value;

        }

        public async Task<GResponseDto<AccessToken>> CreateAccessToken(string email, string password)
        {
            var isValidateUser = ValidateUser(_ldapConfig, email, password);
            if (!isValidateUser) return GResponseDto<AccessToken>.Fail(404, "Invalid user name or password.");

            var user = await _userService.FindByEmailandPassword(email, password);
            if (user.StatusCode != 200)
                return GResponseDto<AccessToken>.Fail(404,
                    "Not found user. Check the information you have entered.");


            if (user.Data == null)
                return GResponseDto<AccessToken>.Fail(404,
                    "Not found user. Check the information you have entered.");


            var accessToken = _tokenHandler.CreateAccessToken(user.Data);
            await _userService.SaveRefreshToken(user.Data.Id, accessToken.RefreshToken,
                DateTime.Now.AddSeconds(_tokenOptions.RefreshTokenExpiration));
            return GResponseDto<AccessToken>.Success(200, accessToken);

        }

        public async Task<GResponseDto<AccessToken>> CreateAccessTokenByRefreshToken(string refreshToken)
        {
            var userRefreshToken = await _userService.GetUserByRefreshToken(refreshToken);
            if (userRefreshToken.StatusCode == 200)
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
            if (userResponse.StatusCode == 200)
            {
                if (userResponse.Data != null) await _userService.RemoveRefreshToken(userResponse.Data.Id);
                return GResponseDto<NoContentDto>.Success(204);
            }
            else
            {
                return GResponseDto<NoContentDto>.Fail(404, "Not found refresh token.");

            }
        }

        public bool ValidateUser(LdapConfig config, string username, string password)

        {

#if !DEBUG
            var tmpUserName = username;
            if (username.Contains("@"))
                tmpUserName = username.Substring(0, username.Length - (username.Length - username.IndexOf('@')));

            string userDn = $"{tmpUserName}@{config.LDAPserver}";
            try
            {
                using var connection = new LdapConnection(new LdapDirectoryIdentifier(config.LDAPserver, config.Port), new NetworkCredential(userDn, password),AuthType.Basic);
                connection.Bind();
                return true;
            }
            catch (LdapException ex)
            {
                // Log exception
            }
            return false;
#endif
            return true;
        }

    }
}
