using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class CartDeleteConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RedirectCart(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Users/Cart.aspx");
        }
    }
}