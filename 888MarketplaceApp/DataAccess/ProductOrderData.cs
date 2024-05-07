using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class ProductOrderData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Product_Order> _productOrders;
        public bool hasExistingData;

        public ProductOrderData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Product_Order.Any();
            _productOrders = _db.Product_Order;
        }

        public List<Product_Order> GetProductOrders()
        {
            var result = _productOrders.ToList();
            return result;
        }

        public Product_Order GetProductOrder(int orderId, int productId)
        {
            var result = _productOrders.Find(orderId, productId);
            return result;
        }

        public Product_Order CreateProductOrder(Product_Order productOrder)
        {
            var result = _productOrders.Add(productOrder);
            _db.SaveChanges();
            return result;
        }

        public void UpdateProductOrder(Product_Order productOrder)
        {
            var target = _productOrders.Find(productOrder.OrderId, productOrder.ProductId);

            if (target != null)
            {
                target.Quantity = productOrder.Quantity;
                target.ProductId = productOrder.ProductId;
                target.ReviewId = productOrder.ReviewId;
                _db.SaveChanges();
            }
        }

        public Product_Order DeleteProductOrder(Product_Order productOrder)
        {
            var result = _productOrders.Remove(productOrder);
            _db.SaveChanges();
            return result;
        }
    }
}