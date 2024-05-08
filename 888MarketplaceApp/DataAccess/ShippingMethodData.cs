using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class ShippingMethodData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<ShippingMethod> _shippingMethods;
        public bool hasExistingData;

        public ShippingMethodData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.ShippingMethods.Any();
            _shippingMethods = _db.ShippingMethods;
        }

        public List<ShippingMethod> GetShippingMethods()
        {
            var result = _shippingMethods.ToList();
            return result;
        }

        public ShippingMethod GetShippingMethod(int id)
        {
            var result = _shippingMethods.Find(id);
            return result;
        }

        public ShippingMethod GetShippingMethodByName(string name)
        {
            var result = _shippingMethods.FirstOrDefault(c => c.Name == name);
            return result;
        }

        public ShippingMethod CreateShippingMethod(ShippingMethod shippingMethod)
        {
            var result = _shippingMethods.Add(shippingMethod);
            _db.SaveChanges();
            return result;
        }

        public void UpdateShippingMethod(ShippingMethod shippingMethod)
        {
            var target = _shippingMethods.Find(shippingMethod.Id);

            if (target != null)
            {
                target.Name = shippingMethod.Name;
                target.Description = shippingMethod.Description;
                _db.SaveChanges();
            }
        }

        public ShippingMethod DeleteShippingMethod(ShippingMethod shippingMethod)
        {
            var target = _shippingMethods.Find(shippingMethod.Id);

            if (target != null)
            {
                var result = _shippingMethods.Remove(target);
                _db.SaveChanges();
                return result;
            }
            return null;
        }
    }
}