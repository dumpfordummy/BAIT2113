using _888MarketplaceApp.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "888 Marketplace";
            var sessionManager = SessionManager.Instance;

            if (sessionManager.GetUserLoginState(Request.Cookies)) {

            }
        }
    }
}