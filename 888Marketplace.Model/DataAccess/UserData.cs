using _888MarketplaceApp.Core.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _888Marketplace.Model.DataAccess
{
    public class UserData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Buyer> _buyers;
        private readonly DbSet<Seller> _sellers;
        private readonly DbSet<Administrator> _administrators;

        public UserData(MarketplaceDb db)
        {
            _db = db;
            _buyers = db.Buyers;
            _sellers = db.Sellers;
            _administrators = db.Administrators;
        }

        public Task<List<Buyer>> GetBuyersAsync()
        {
            var result = _buyers.ToListAsync();
            return result;
        }

        public Task<List<Seller>> GetSellersAsync()
        {
            var result = _sellers.ToListAsync();
            return result;
        }

        public Task<List<Administrator>> GetAdministratorsAsync()
        {
            var result = _administrators.ToListAsync();
            return result;
        }

        public Task<Buyer> GetBuyerAsync(int id)
        {
            var result = _buyers.FindAsync(id);
            return result;
        }

        public Task<Seller> GetSellerAsync(int id)
        {
            var result = _sellers.FindAsync(id);
            return result;
        }

        public Task<Administrator> GetAdministratorAsync(int id)
        {
            var result = _administrators.FindAsync(id);
            return result;
        }
    }
}
