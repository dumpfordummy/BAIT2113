using _888MarketplaceApp.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class BillingData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Billing> _billings;
        public bool hasExistingData;

        public BillingData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Billings.Any();
            _billings = _db.Billings;
        }

        public List<Billing> GeBillings()
        {
            return _billings.ToList(); 
        }

        public Billing GetBilling(int id) 
        {
            return _billings.Find(id);
        }

        public Billing CreateBilling(Billing billing)
        {
            var result = _billings.Add(billing);
            _db.SaveChanges();
            return result;
        }
    }
}