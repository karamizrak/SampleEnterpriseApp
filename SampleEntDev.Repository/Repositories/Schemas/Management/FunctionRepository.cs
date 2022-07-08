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

            //var function = await context.Functions.Include(x => x.UserToFuncitons)
            //    .FirstOrDefaultAsync(x => x.UserToFuncitons.Any(c => c.UserId == userId));

            return fList.ToList();

        }
    }
}
