using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Repositories.Schemas.Management;

namespace SampleEntDev.Repository.Repositories.Schemas.Management
{
    public class RoleRepository : GenericRepository<Roles>, IRoleRepository
    {
        public RoleRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<IEnumerable<Roles>> GetUserAuthorizedRoles(int userId)
        {
            var roles = await context.UserToRoles.Where(x => x.UserId == userId).Select(s => s.Role).ToListAsync();
            return roles;
        }
    }
}