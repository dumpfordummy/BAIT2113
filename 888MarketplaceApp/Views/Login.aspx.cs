﻿using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static _888MarketplaceApp.Models.User;


namespace _888MarketplaceApp.Views
{
    public partial class Login : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "~/register";

        }


        protected void LogIn(object sender, EventArgs e)
        {
            string username = Username.Text;
            string password = Password.Text;

            UserData userAccess = new UserData();

            User user = userAccess.GetUserByUsername(username);
            if(user != null)
            {
                bool isPasswordCorrect = PasswordHelper.VerifyHashedPassword(user.PasswordHash, password);
                if(isPasswordCorrect)
                {
                    LoginSuccess(user);
                } else
                {
                    InvalidLogin();
                }
            } else
            {
                InvalidLogin();
            }
        }

        private void LoginSuccess(User user)
        {
            var sessionManager = SessionManager.Instance;
            var userSession = new UserSessionModel(user.Id, user.Username);
            string authenticationCookie = sessionManager.OpenSession(userSession);
            Response.Cookies.Add(new HttpCookie(authenticationCookie));
            Response.Redirect("/");
        }

        private void InvalidLogin()
        {
            Result.Text = "Invalid username or password. Please try again.";
        }
    }
}