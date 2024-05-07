using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class PaymentMethodData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<PaymentMethod> _paymentMethods;

        public PaymentMethodData()
        {
            _db = new MarketplaceDb();
            _paymentMethods = _db.PaymentMethods;
        }

        public List<PaymentMethod> GetPaymentMethods()
        {
            var result = _paymentMethods.ToList();
            return result;
        }

        public PaymentMethod GetPaymentMethod(int id)
        {
            var result = _paymentMethods.Find(id);
            return result;
        }

        public PaymentMethod GetPaymentMethodByName(string name)
        {
            var result = _paymentMethods.FirstOrDefault(c => c.Name == name);
            return result;
        }

        public PaymentMethod CreatePaymentMethod(PaymentMethod paymentMethod)
        {
            var result = _paymentMethods.Add(paymentMethod);
            _db.SaveChanges();
            return result;
        }

        public void UpdatePaymentMethod(PaymentMethod paymentMethod)
        {
            var target = _paymentMethods.Find(paymentMethod.Id);

            if (target != null)
            {
                target.Name = paymentMethod.Name;
                target.Description = paymentMethod.Description;
                _db.SaveChanges();
            }
        }

        public PaymentMethod DeletePaymentMethod(PaymentMethod paymentMethod)
        {
            var result = _paymentMethods.Remove(paymentMethod);
            _db.SaveChanges();
            return result;
        }
    }
}