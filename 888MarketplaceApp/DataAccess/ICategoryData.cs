using _888MarketplaceApp.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _888MarketplaceApp.DataAccess
{
    public interface ICategoryData
    {
        Category CreateCategory(Category category);
        Task<List<Category>> GetCategoriesAsync();
        Task<Category> GetCategoryAsync(string name);
        void UpdateCategory(Category category);
    }
}