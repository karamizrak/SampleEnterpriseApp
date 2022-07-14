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

        public async Task<IEnumerable<Roles>> GetRolesFromFunctionByUserId(int userId, string? actionName, string? controllerName,
            string? areaName)
        {
            var userInRoles = await context.UserToRoles.Where(x => x.UserId == userId).ToListAsync();
            var query = context.Functions
                .Include(c => c.UserToFuncitons)
                .Include(c => c.RoleToFunctions)
                .AsQueryable();


            if (!string.IsNullOrWhiteSpace(actionName))
                query = query.Where(x => x.ActionName == actionName);
            if (!string.IsNullOrWhiteSpace(controllerName))
                query = query.Where(x => x.ControllerName == controllerName);
            if (!string.IsNullOrWhiteSpace(areaName))
                query = query.Where(x => x.AreaName == areaName);

            var tmpList = await
                query.SelectMany(c => c.RoleToFunctions.ToList().Select(v => v.Role))
                    .Distinct().ToListAsync();
            var roleFuncitonList = tmpList.Intersect(userInRoles.Select(c => c.Role)).ToList();


            return roleFuncitonList;
        }
    }
}