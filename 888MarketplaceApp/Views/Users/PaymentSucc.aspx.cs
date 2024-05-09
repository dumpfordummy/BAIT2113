using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views.Users
{
    public partial class PaymentSucc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void TrackingOrder(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Users/MyPurchases.aspx");
        }

        public void BacktoHome(object sender, EventArgs e)
        {
            Response.Redirect("/Views/LandingPage.aspx");
        }
    }
}