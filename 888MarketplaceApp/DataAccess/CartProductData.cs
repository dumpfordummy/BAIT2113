using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.DataAccess
{
    public class CartProductData
    {
        private readonly MarketplaceDb _db;
        private readonly DbSet<Cart_Product> _cartProducts;
        public bool hasExistingData;

        public CartProductData()
        {
            _db = new MarketplaceDb();
            hasExistingData = _db.Cart_Product.Any();
            _cartProducts = _db.Cart_Product;
        }

        public List<Cart_Product> GetCartProducts()
        {
            var result = _cartProducts.ToList();
            return result;
        }

        public Cart_Product GetCartProduct(int id)
        {
            var result = _cartProducts.Find(id);
            return result;
        }

        public List<Cart_Product> GetCartProductsByCartId(int cartId)
        {
            var result = _cartProducts.Where(c => c.CartId == cartId).ToList();
            return result;
        }

        public Cart_Product CreateCartProduct(Cart_Product cartProduct)
        {
            var result = _cartProducts.Add(cartProduct);
            _db.SaveChanges();
            return result;
        }

        public void UpdateCartProduct(Cart_Product cartProduct)
        {
            var target = _cartProducts.Find(cartProduct.Id);

            if (target != null)
            {
                target.Quantity = cartProduct.Quantity;
                target.ProductId = cartProduct.ProductId;
                target.CartId = cartProduct.CartId;
                _db.SaveChanges();
            }
        }

        public Cart_Product DeleteCartProduct(Cart_Product cartProduct)
        {
            var target = _cartProducts.Find(cartProduct.Id);

            if (target != null)
            {
                var result = _cartProducts.Remove(target);
                _db.SaveChanges();
                return result;
            }
            return null;
        }
    }
}