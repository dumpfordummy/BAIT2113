using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Wishlist : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SessionManager sessionManager = SessionManager.Instance;

                User user = sessionManager.GetLoggedInUser(Request.Cookies);

                Models.Wishlist userWishlist= user.Wishlists.FirstOrDefault();
                var customWishlistProductsDataSource = userWishlist.Wishlist_Product.Select(wp => new
                {
                    wp.Product,
                    ImagePath = wp.Product.GetImagePathList()[0],
                    WishlistQuantity = wp.Quantity,
                    WishlistAmount = "RM" + (wp.Product.Price * wp.Quantity).ToString()
                }).ToList();

                WishlistRepeater.DataSource = customWishlistProductsDataSource;
                WishlistRepeater.DataBind();
            }
        }
    }
}