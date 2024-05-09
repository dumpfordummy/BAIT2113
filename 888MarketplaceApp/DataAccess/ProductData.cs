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

        public List<Product> GetProductsBySimilarName(string name)
        {
            var result = _products.Where(c => c.Name.Contains(name)).ToList();
            return result;
        }

        public List<Product> GetProductsBySellerId(int sellerId)
        {
            var result = _products.Where(c => c.SellerId == sellerId).ToList();
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
                target.ImagePaths = product.ImagePaths;
                target.IsBan = product.IsBan;
                _db.SaveChanges();
            }
        }

        public Product DeleteProduct(Product product)
        {
            var target = _products.Find(product.Id);
            if (target != null)
            {
                var result = _products.Remove(target);
                _db.SaveChanges();
                return result;
            }

            return null;
        }

    }
}