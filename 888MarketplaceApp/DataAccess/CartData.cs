using _888MarketplaceApp.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class CartData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Cart> _carts;
        public bool hasExistingData;

        public CartData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Carts.Any();
            _carts = _db.Carts;
        }

        public List<Cart> GetCarts()
        {
            return _carts.ToList(); 
        }

        public Cart GetCart(int id) 
        {
            return _carts.Find(id);
        }

        public Cart GetCartByBuyerId(int buyerId)
        {
            return _carts.FirstOrDefault(c => c.BuyerId == buyerId);
        }

        public Cart CreateCart(Cart cart)
        {
            var result = _carts.Add(cart);
            _db.SaveChanges();
            return result;
        }
    }
}