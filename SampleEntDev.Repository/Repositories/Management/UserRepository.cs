using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Repositories.Schemas.Management;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Repository.Repositories.Management
{
    public class UserRepository : GenericRepository<User>, IUserRepository
    {
        public UserRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<User> FindByEmailandPassword(string email, string password)
        {
            var cryptPass = SHA1.Create(password);
            var user = await context.User.FirstOrDefaultAsync(x => x.EMail== email && x.Password== password);
            return user;
        }

        public Task<User> GetUserByRefreshToken(string refreshToken)
        {
            var user = context.User.FirstOrDefaultAsync(x => x.RefreshToken == refreshToken);
            return user;
        }

        public async Task RemoveRefreshToken(int userId)
        {
            var userTmp = await this.GetByIdAsync(userId);

            if (userTmp != null)
            {
                userTmp.RefreshToken = null;
                userTmp.RefreshTokenEndDate = null;
            }
        }

        public async Task SaveRefreshToken(int userId, string refreshToken, DateTime refreshTokenExpiration)
        {
            var userTmp = await this.GetByIdAsync(userId);
            if (userTmp != null)
            {
                userTmp.RefreshToken = refreshToken;
                userTmp.RefreshTokenEndDate = refreshTokenExpiration;
                Update(userTmp);
            }
        }
    }
}
