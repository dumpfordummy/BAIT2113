using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class WishlistData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Wishlist> _wishLists;
        public bool hasExistingData;

        public WishlistData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Wishlists.Any();
            _wishLists = _db.Wishlists;
        }

        public List<Wishlist> GetWishlists()
        {
            return _wishLists.ToList();
        }

        public Wishlist GetWishlist(int id)
        {
            return _wishLists.Find(id);
        }

        public Wishlist GetWishlistByBuyerId(int buyerId)
        {
            return _wishLists.FirstOrDefault(c => c.BuyerId == buyerId);
        }

        public Wishlist CreateWishlist(Wishlist wishlist)
        {
            var result = _wishLists.Add(wishlist);
            _db.SaveChanges();
            return result;
        }
    }
}