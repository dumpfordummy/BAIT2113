using _888MarketplaceApp.Core.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace _888Marketplace.Model.DataAccess
{
    public class CategoryData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Category> _categories;
        public CategoryData(MarketplaceDb db)
        {
            _db = db;
            _categories = db.Categories;
        }

        public async Task<List<Category>> GetCategoriesAsync()
        {
            var result = await _categories.ToListAsync();
            return result;
        }

        public async Task<Category> GetCategoryAsync(string name)
        {
            var result = await _categories.FirstOrDefaultAsync(c => c.Name == name);
            return result;
        }

        public Category CreateCategory(Category category)
        {
            var result = _categories.Add(category);
            _db.SaveChanges();
            return result;
        }

        public void UpdateCategory(Category category)
        {
            var target = _categories.Find(category.Id);

            if (target != null)
            {
                target.Name = category.Name;
                target.Description = category.Description;
                _db.SaveChanges();
            }
        }


    }
}
