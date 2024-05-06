using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using _888MarketplaceApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendVerification(object sender, EventArgs e)
        {
            UserData userAccess = new UserData();
            User user = userAccess.GetUserByEmail(Email.Text);

            if(user != null)
            {
                string token = VerificationTokenManager.GenerateToken();
                string url = $"/Views/ResetPassword?id={user.Id}&token={token}";
                user.VerificationToken = token;
                user.VerificationExpire = DateTime.Now.AddMinutes(VerificationTokenManager.VerificationExpireMinute);
                userAccess.UpdateUser(user);

                RegisterAsyncTask(new PageAsyncTask(() => EmailSender.SendForgotVerificationAsync(user, url)));
            }

            Result.Text = "A verification link has been sent, please check your email";
        }
    }
}