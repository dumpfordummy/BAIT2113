using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class UserroleData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Userrole> _userRoles;

        public UserroleData()
        {
            _db = new MarketplaceDb();
            _userRoles = _db.Userroles;
        }

        public List<Userrole> GetUserroles()
        {
            var result = _userRoles.ToList();
            return result;
        }

        public Userrole GetUserrole(int id)
        {
            var result = _userRoles.Find(id);
            return result;
        }

        public Userrole GetUserroleByName(string role)
        {
            var result = _userRoles.FirstOrDefault(c => c.Role == role);
            return result;
        }

        public Userrole CreateUserrole(Userrole userrole)
        {
            var result = _userRoles.Add(userrole);
            _db.SaveChanges();
            return result;
        }
    }
}