using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class DeliveryData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Delivery> _deliveries;

        public DeliveryData()
        {
            _db = new MarketplaceDb();
            _deliveries = _db.Deliveries;        
        }

        public List<Delivery> GetDeliveries()
        {
            return _deliveries.ToList();    
        }

        public Delivery GetDelivery(int deliveryId)
        {
            return _deliveries.Find(deliveryId);
        }

        public Delivery CreateDelivery(Delivery delivery)
        {
            var result = _deliveries.Add(delivery);
            _db.SaveChanges();
            return result;
        }

        public void UpdateDelivery(Delivery delivery)
        {
            var target = _deliveries.Find(delivery.Id);

            if (target != null)
            {
                target.Address = delivery.Address;
                target.ShippingMethodId = delivery.ShippingMethodId;
                target.EstimatedDeliveryDate = delivery.EstimatedDeliveryDate;
                _db.SaveChanges();
            }
        }
    }
}