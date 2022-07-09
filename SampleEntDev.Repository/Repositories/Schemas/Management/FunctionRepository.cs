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
    public class FunctionRepository : GenericRepository<Functions>, IFunctionRepository
    {
        public FunctionRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<IEnumerable<Functions>> GetUserAuthorizedFunctions(int userId)
        {
            var fList = await context.UserToFuncitons.Include(x => x.Function).Where(x => x.UserId == userId)
                .Select(s => s.Function).ToListAsync();

            return fList.ToList();
        }

        public async Task<Functions?> GetUserAuthorizedFunctions(int userId, string? functionName,
            string? controllerName, string? areaName = null)
        {
            var query = context.UserToFuncitons.Include(x => x.Function).AsQueryable();
            if (!string.IsNullOrWhiteSpace(functionName))
                query = query.Where(c => c.Function.ActionName == functionName);
            if (!string.IsNullOrWhiteSpace(controllerName))
                query = query.Where(v => v.Function.ControllerName == controllerName);
            if (!string.IsNullOrWhiteSpace(areaName))
                query = query.Where(v => v.Function.AreaName == areaName);
            query = query.Where(x => x.UserId == userId);
            var flist = await query.Select(s => s.Function).FirstOrDefaultAsync();
            return flist;
        }
    }
}