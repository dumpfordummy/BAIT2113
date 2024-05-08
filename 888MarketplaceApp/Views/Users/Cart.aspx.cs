using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            CartData dataAccess = new CartData();
            Models.Cart userCartInDb = dataAccess.GetCart(userCart.Id);
            var customCartProductsDataSource = userCartInDb.Cart_Product.Select(cp => new
            {
                cp.Product,
                CartQuantity = cp.Quantity,
                CartAmount = "RM" + (cp.Product.Price * cp.Quantity).ToString()
            }).ToList();

            CartRepeater.DataSource = customCartProductsDataSource;
            CartRepeater.DataBind();
        }

        protected void DeleteCartItem(object sender, EventArgs e)
        {
            Button closeButton = (Button)sender;
            int productId = int.Parse(closeButton.CommandArgument);
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            Cart_Product cartProduct = userCart.Cart_Product.Where(cp => cp.ProductId == productId).FirstOrDefault();
            CartProductData dataAccess = new CartProductData();
            Cart_Product cartProductInDb = dataAccess.GetCartProduct(cartProduct.Id);
            dataAccess.DeleteCartProduct(cartProductInDb);
            Response.Redirect("/Views/Users/CartDeleteConfirmation.aspx");
        }

        protected void UpdateCart(object sender, EventArgs e)
        {
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
    }
}