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

        public UserData(MarketplaceDb db)
        {
            _db = db;
        }
    }
}
