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

        public async Task<List<Buyer>> GetBuyersAsync()
        {
            var result = await _buyers.ToListAsync();
            return result;
        }

        public async Task<List<Seller>> GetSellersAsync()
        {
            var result = await _sellers.ToListAsync();
            return result;
        }

        public async Task<List<Administrator>> GetAdministratorsAsync()
        {
            var result = await _administrators.ToListAsync();
            return result;
        }

        public async Task<IUser> GetUserAsync(IUser user)
        {
            IUser result = await _buyers.FindAsync(user.Id);
            if (result == null)
            {
                result = await _sellers.FindAsync(user.Id);
                if(result == null)
                {
                    result = await _administrators.FindAsync(user.Id);
                }
            }
            return result;
        }
    }
}
