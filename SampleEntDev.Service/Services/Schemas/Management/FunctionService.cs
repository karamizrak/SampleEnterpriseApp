using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleEntDev.Core.Dtos;
using SampleEntDev.Core.Dtos.Schemas.Management;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.IUnitOfWorks;
using SampleEntDev.Core.Repositories;
using SampleEntDev.Core.Services.Schemas.Management;

namespace SampleEntDev.Service.Services.Schemas.Management
{
    public class FunctionService:GenericService<Functions>, IFunctionService
    {
        public FunctionService(IGenericRepository<Functions> repository, IUnitOfWork unitOfWork) : base(repository, unitOfWork)
        {
        }

        public Task<GResponseDto<FunctionDto>> GetUserAuthorizedFunctions(int userId)
        {
            return null;
        }
    }
}
