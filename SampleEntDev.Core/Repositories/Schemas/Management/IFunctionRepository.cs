using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleEntDev.Core.Entities.Schemas;

namespace SampleEntDev.Core.Repositories.Schemas.Management
{
    public interface IFunctionRepository:IGenericRepository<Functions>
    {
        Task<IEnumerable<Functions>> GetUserAuthorizedFunctions(int userId);
    }
}
