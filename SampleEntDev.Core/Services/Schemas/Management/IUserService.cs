using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Services.Schemas.Management
{
    public interface IUserService : IGenericService<User>
    {
        Task<GResponseDto<UserDto>> FindByEmailandPassword(string email, string password);
        Task SaveRefreshToken(int userId, string refreshToken, DateTime refreshTokenExpiration);
        Task<GResponseDto<UserDto>> GetUserByRefreshToken(string refreshToken);
        Task RemoveRefreshToken(int userId);
    }
}


