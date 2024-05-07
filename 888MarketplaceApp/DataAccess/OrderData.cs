using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class OrderData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Order> _orders;
        public bool hasExistingData;
        public OrderData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Orders.Any();
            _orders = _db.Orders;
        }

        public List<Order> GetOrders()
        {
            var result = _orders.ToList();
            return result;
        }

        public Order GetOrder(int id)
        {
            var result = _orders.Find(id);
            return result;
        }

        public Order CreateOrder(Order order)
        {
            var result = _orders.Add(order);
            _db.SaveChanges();
            return result;
        }

        public void UpdateOrder(Order order)
        {
            var target = _orders.Find(order.Id);

            if (target != null)
            {
                target.Amount = order.Amount;
                target.Note = order.Note;
                target.Status = order.Status;
                _db.SaveChanges();
            }
        }
    }
}