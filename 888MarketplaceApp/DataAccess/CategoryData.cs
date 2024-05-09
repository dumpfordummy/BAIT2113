using _888MarketplaceApp.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace _888MarketplaceApp.DataAccess
{
    public class CategoryData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Category> _categories;
        public bool hasExistingData;
        public CategoryData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Categories.Any();
            _categories = _db.Categories;
        }

        public List<Category> GetCategories()
        {
            var result = _categories.ToList();
            return result;
        }

        public Category GetCategory(int id)
        {
            var result = _categories.Find(id);
            return result;
        }

        public Category GetCategoryByName(string name)
        {
            var result = _categories.FirstOrDefault(c => c.Name == name);
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

        public Category DeleteCategory(Category category)
        {
            var target = _categories.Find(category.Id);

            if (target != null)
            {
                var result = _categories.Remove(category);
                _db.SaveChanges();
                return result;
            }
            return null;
        }
    }
}
