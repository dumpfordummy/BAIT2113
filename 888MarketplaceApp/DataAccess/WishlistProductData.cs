using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class WishlistProductData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Wishlist_Product> _wishlistProducts;
        public bool hasExistingData;

        public WishlistProductData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Wishlist_Product.Any();
            _wishlistProducts = _db.Wishlist_Product;
        }

        public List<Wishlist_Product> GetWishlistProduct()
        {
            var result = _wishlistProducts.ToList();
            return result;
        }

        public Wishlist_Product GetWishlistProduct(int id)
        {
            var result = _wishlistProducts.Find(id);
            return result;
        }

        public Wishlist_Product GetWishlistProductByWishlistId(int wishlistId)
        {
            var result = _wishlistProducts.FirstOrDefault(c => c.WishlistId == wishlistId);
            return result;
        }

        public Wishlist_Product CreateWishlistProduct(Wishlist_Product wishlistProduct)
        {
            var result = _wishlistProducts.Add(wishlistProduct);
            _db.SaveChanges();
            return result;
        }

        public void UpdateWishlistProduct(Wishlist_Product wishlistProduct)
        {
            var target = _wishlistProducts.Find(wishlistProduct.Id);

            if (target != null)
            {
                target.Quantity = wishlistProduct.Quantity;
                target.ProductId = wishlistProduct.ProductId;
                target.WishlistId = wishlistProduct.WishlistId;
                _db.SaveChanges();
            }
        }

        public Wishlist_Product DeleteWishlistProduct(Wishlist_Product wishlistProduct)
        {
            var target = _wishlistProducts.Find(wishlistProduct.Id);

            if (target != null)
            {
                var result = _wishlistProducts.Remove(target);
                _db.SaveChanges();
                return result;
            }
            return null;
        }
    }
}