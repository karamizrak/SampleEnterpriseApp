using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Repositories.Schemas.ECommerce
{
    public interface IProductRepository:IGenericRepository<Product> 
    {
        Task<List<Product>> GetProductWithCategory();
    }
}
