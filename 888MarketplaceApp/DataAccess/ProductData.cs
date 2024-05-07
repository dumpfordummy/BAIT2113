using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class ProductData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Product> _products;
        public bool hasExistingData;

        public ProductData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Products.Any();
            _products = _db.Products;
        }

        public List<Product> GetProducts()
        {
            var result = _products.ToList();
            return result;
        }

        public Product GetProduct(int id)
        {
            var result = _products.Find(id);
            return result;
        }

        public Product GetProductByName(string name)
        {
            var result = _products.FirstOrDefault(c => c.Name == name);
            return result;
        }

        public Product CreateProduct(Product product)
        {
            var result = _products.Add(product);
            _db.SaveChanges();
            return result;
        }

        public void UpdateProduct(Product product)
        {
            var target = _products.Find(product.Id);

            if (target != null)
            {
                target.Name = product.Name;
                target.Description = product.Description;
                target.Price = product.Price;
                target.Quantity = product.Quantity;
                target.CategoryId = product.CategoryId;
                _db.SaveChanges();
            }
        }

        public Product DeleteProduct(Product product)
        {
            var result = _products.Remove(product);
            _db.SaveChanges();
            return result;
        }
    }
}