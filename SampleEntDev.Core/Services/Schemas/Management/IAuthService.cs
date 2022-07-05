using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.PublicDtos;
using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Services.Schemas.Management
{
    public interface IAuthService 
    {
        Task<GResponseDto<AccessToken>> CreateAccessToken(string email, string password);
        Task<GResponseDto<AccessToken>> CreateAccessTokenByRefreshToken(string refreshToken);
        Task<GResponseDto<NoContentDto>> RemoveRefreshToken(string refreshToken);
    }
}
