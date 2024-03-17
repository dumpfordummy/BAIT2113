using _888MarketplaceApp.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace _888Marketplace.Model.DataAccess
{
    public interface ICategoryData
    {
        Category CreateCategory(Category category);
        Task<List<Category>> GetCategoriesAsync();
        Task<Category> GetCategoryAsync(string name);
        void UpdateCategory(Category category);
    }
}