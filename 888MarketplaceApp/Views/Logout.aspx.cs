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
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            string cookie;
            sessionManager.CloseSession(Request.Cookies[sessionManager.TokenName].Value, out cookie);
            Response.Cookies.Add(new HttpCookie(cookie));
        }
    }
}