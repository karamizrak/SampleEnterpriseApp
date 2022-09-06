using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Repositories.Schemas.Management
{
    public interface IUserRepository : IGenericRepository<Users>
    {
        Task<Users?> FindByEmailandPassword(string email, string password);
        Task SaveRefreshToken(int userId, string refreshToken, DateTime refreshTokenExpiration);
        Task<Users> GetUserByRefreshToken(string refreshToken);
        Task RemoveRefreshToken(int userId);
    }
}
