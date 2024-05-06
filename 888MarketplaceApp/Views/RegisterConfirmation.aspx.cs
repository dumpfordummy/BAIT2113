using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class RegisterConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            if (Request.QueryString["id"] == null || Request.QueryString["token"] == null)
            {
                InvalidPlaceholder.Visible = true;
            }
            else
            {
                int id = int.Parse(Request.QueryString["id"]);
                string token = Request.QueryString["token"];
                UserData userAccess = new UserData();
                User user = userAccess.GetUser(id);

                if (string.IsNullOrEmpty(user.VerificationToken) || user.VerificationExpire == null || !user.VerificationToken.Equals(token) || !(user.VerificationExpire > DateTime.Now))
                {
                    InvalidPlaceholder.Visible = true;
                }
                else
                {
                    user.AccountVerified = true;
                    user.VerificationToken = null;
                    user.VerificationExpire = null;
                    userAccess.UpdateUser(user);
                    ValidPlaceholder.Visible = true;
                }
            }
        }
        protected void RedirectHome(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
    }
}