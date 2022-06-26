using SampleEntDev.Core.Entities.Schemas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Core.Repositories.Schemas.ECommerce
{
    public interface ICategoryRepository: IGenericRepository<Category>
    {
        Task<Category> GetSingleCategoryByIdWithProductsAsnyc(int categoryId);
    }
}
