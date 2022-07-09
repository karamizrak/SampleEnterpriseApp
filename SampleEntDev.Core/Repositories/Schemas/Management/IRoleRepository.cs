using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleEntDev.Core.Entities.Schemas;

namespace SampleEntDev.Core.Repositories.Schemas.Management
{
    public interface IRoleRepository : IGenericRepository<Roles>
    {
        Task<IEnumerable<Roles>> GetUserAuthorizedRoles(int userId);
    }
}