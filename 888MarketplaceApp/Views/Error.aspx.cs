using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ErrorMessage"] != null)
            {
                string errorMessage = Session["ErrorMessage"].ToString();
                lblErrorMessage.Text = errorMessage;
                Session.Remove("ErrorMessage");
            }
        }
    }
}