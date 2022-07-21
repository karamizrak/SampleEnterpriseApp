using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Repositories.Schemas.Management;

namespace SampleEntDev.Repository.Repositories.Schemas.Management
{
    public class MenuRepository : GenericRepository<Menu>, IMenuRepository
    {
        public MenuRepository(AppDbContext context) : base(context)
        {
        }
    }
}