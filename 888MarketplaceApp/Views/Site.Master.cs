using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public bool IsUserLoggedIn = false;
        public bool IsUserAdmin = false;
        public User loggedInUser = User.empty;

        protected void Page_Init(object sender, EventArgs e)
        {
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            if (sessionManager.GetUserLoginState(Request.Cookies))
            {
                if(user.IsUserAdmin())
                {
                    IsUserAdmin = true; 
                }
                IsUserLoggedIn = true;
                loggedInUser = sessionManager.GetLoggedInUser(Request.Cookies);
            }

            lnkAccount.NavigateUrl = "~/Views/Users/Account";

            updateWishlistAndCart();
        }

        protected void updateWishlistAndCart()
        {
            var sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            if (user.Id != 0)
            {
                Models.Cart userCart = user.Carts.FirstOrDefault();
                CartData dataAccess = new CartData();
                Models.Cart userCartInDb = dataAccess.GetCart(userCart.Id);
                cartItemCount.InnerText = userCartInDb.Cart_Product.Count.ToString();

                Models.Wishlist wishlist = user.Wishlists.FirstOrDefault();
                WishlistData wishlistData = new WishlistData();
                Models.Wishlist userWishlistInDb = wishlistData.GetWishlist(wishlist.Id);
                wishlistCount.InnerText = userWishlistInDb.Wishlist_Product.Count.ToString();
            }
            else
            {
                wishlistCount.InnerText = "0";
                cartItemCount.InnerText = "0";
            }
        }

        protected void LoggingOut(object sender, LoginCancelEventArgs e)
        {
        }
    }
}