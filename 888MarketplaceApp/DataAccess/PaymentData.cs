using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class PaymentData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Payment> _payments;
        public bool hasExistingData;

        public PaymentData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Payments.Any();   
            _payments = _db.Payments;
        }

        public List<Payment> GetPayments()
        {
            var result = _payments.ToList();
            return result;
        }

        public Payment GetPayment(int id)
        {
            var result = _payments.Find(id);
            return result;
        }

        public Payment CreatePayment(Payment payment)
        {
            var result = _payments.Add(payment);
            _db.SaveChanges();
            return result;
        }
    }
}