using Microsoft.EntityFrameworkCore;
using SampleEntDev.Core.Entities.Schemas;
using SampleEntDev.Core.Repositories.Schemas.ECommerce;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleEntDev.Repository.Repositories.Schemas.ECommerce
{
    public class CategoryRepository : GenericRepository<Category>,ICategoryRepository
    {
        public CategoryRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<Category> GetSingleCategoryByIdWithProductsAsnyc(int categoryId)
        {
            var ss= await context.Category.Include(x => x.Product).Where(x => x.Id == categoryId).SingleOrDefaultAsync();

            return ss??new Category();
        }
    }
}
