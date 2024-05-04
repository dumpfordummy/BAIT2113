using _888MarketplaceApp.Helper;
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
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            var sessionManager = SessionManager.Instance;
            var cookies = Request.Cookies;
            if (sessionManager.GetUserLoginState(cookies))
            {
                var authenticationCookie = sessionManager.RenewSession(cookies[sessionManager.TokenName].Value);
                Response.Cookies.Add(new HttpCookie(authenticationCookie));
                
            }
        }
    }
}