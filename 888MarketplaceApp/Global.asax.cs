using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace _888MarketplaceApp
{
    public class Global : HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            DataSeeder.Seed();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            url = url.Replace("/Views/", "/");

            var sessionManager = SessionManager.Instance;
            var cookies = Request.Cookies;
            var isLoggedIn = sessionManager.GetUserLoginState(cookies);
            User user = isLoggedIn ? sessionManager.GetLoggedInUser(cookies) : Models.User.empty;

            if (url.StartsWith("/Admin/"))
            {
                if (!isLoggedIn || !user.AccountVerified || !user.IsUserAdmin())
                {
                    HttpContext.Current.Response.Redirect("/Views/Unauthorized.aspx");
                    return;
                }
            }
            else if (url.StartsWith("/Users/"))
            {
                if (!isLoggedIn || !user.AccountVerified || (!user.IsUserAdmin() && !user.IsUserCustomer()))
                {
                    HttpContext.Current.Response.Redirect("/Views/Unauthorized.aspx");
                    return;
                }
            }

            if (isLoggedIn)
            {
                var authenticationCookie = sessionManager.RenewSession(cookies[sessionManager.TokenName].Value);
                Response.Cookies.Add(new HttpCookie(authenticationCookie));
            }
        }
    }
}