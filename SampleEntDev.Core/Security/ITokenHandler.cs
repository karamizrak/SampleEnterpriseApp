
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using System;
using System.Collections.Generic;

using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Threading.Tasks;

using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;

namespace SampleEntDev.Core.Security
{
    public interface ITokenHandler
    {
        AccessToken CreateAccessToken(UserDto user);
        void RevokeRefreshToken(UserDto user);
    }

    public class TokenHandler : ITokenHandler
    {
        private readonly TokenOptions _tokenOptions;
        public TokenHandler(IOptions<TokenOptions> tokenOption)

        {
            _tokenOptions = tokenOption.Value;
        }
        public AccessToken CreateAccessToken(UserDto user)
        {
            var accessTokenExpiration = DateTime.Now.AddDays(_tokenOptions.AccessTokenExpiration);
            var securityKey = SignHandler.GetSecurityKey(_tokenOptions.SecretKey);
            var signingCredetial = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var securityToken = new JwtSecurityToken(issuer: _tokenOptions.Issuer, audience: _tokenOptions.Audience, expires: accessTokenExpiration, signingCredentials: signingCredetial, claims: GetClaims(user));
            var handler = new JwtSecurityTokenHandler();
            var token = handler.WriteToken(securityToken);

            return new AccessToken()
            {
                Token = token,
                RefreshToken = CreateRefreshToken(),
                Expiration = accessTokenExpiration
            };
        }

        public void RevokeRefreshToken(UserDto user)
        {
            user.RefreshToken = null;
        }

        private IEnumerable<Claim> GetClaims(UserDto user)
        {
            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier,user.Id.ToString()),
                new Claim(ClaimTypes.Name,$"{user.Name} {user.Surename}"),
                new Claim("Email",user.EMail),
                new Claim(JwtRegisteredClaimNames.FamilyName,user.Surename),
                new Claim("Roles","Role1,Role2,Role3"),
                new Claim(JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString())
            };
            return claims;
        }

        private string CreateRefreshToken()
        {
            var numberByte = new byte[32];
            using (var randomNumberGen = RandomNumberGenerator.Create())
            {
                randomNumberGen.GetBytes(numberByte);
                return Convert.ToBase64String(numberByte);
            }
        }
      
    }
}
