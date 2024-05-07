using _888MarketplaceApp.DataAccess;
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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["token"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    string token = Request.QueryString["token"];
                    UserData userAccess = new UserData();
                    User user = userAccess.GetUser(id);

                    if (!string.IsNullOrEmpty(user.VerificationToken) && user.VerificationExpire != null && user.VerificationToken.Equals(token) && user.VerificationExpire > DateTime.Now && user.AccountVerified)
                    {
                        ValidPlaceholder.Visible = true;
                    } else
                    {
                        InvalidPlaceholder.Visible = true;
                    }
                }
                else
                {
                    InvalidPlaceholder.Visible = true;
                }
            }
        }

        protected void ConfirmResetPassword(object sender, EventArgs e)
        {
            if(IsInputValid())
            {
                int id = int.Parse(Request.QueryString["id"]);
                UserData userAccess = new UserData();
                User user = userAccess.GetUser(id);

                string newPasswordHash = PasswordHelper.HashPassword(Password.Text);
                user.PasswordHash = newPasswordHash;
                user.VerificationToken = null;
                user.VerificationExpire = null;
                userAccess.UpdateUser(user);

                Result.Text = "Password Updated Successfully";
                HomeUrlPlaceholder.Visible = true;
            }
        }

        private bool IsInputValid()
        {
            return (passwordValidator.IsValid && confirmPasswordValidator.IsValid);
        }

        protected void PasswordValidator(object sender, ServerValidateEventArgs e)
        {
            string inputValue = e.Value;
            if (string.IsNullOrEmpty(inputValue))
            {
                passwordValidator.ErrorMessage = "The Password field is required";
                e.IsValid = false;
            }
            else if (inputValue.Length < 8)
            {
                passwordValidator.ErrorMessage = "Password must be more than 8 characters";
                e.IsValid = false;
            }
            else
            {
                passwordValidator.ErrorMessage = "";
                e.IsValid = true;
            }
        }

        protected void ConfirmPasswordValidator(object sender, ServerValidateEventArgs e)
        {
            string inputValue = e.Value;
            if (string.IsNullOrEmpty(inputValue))
            {
                confirmPasswordValidator.ErrorMessage = "The Confirm Password field is required";
                e.IsValid = false;
            }
            else if (Password.Text != inputValue)
            {
                confirmPasswordValidator.ErrorMessage = "The Confirm Password must match with Password";
                e.IsValid = false;
            }
            else
            {
                confirmPasswordValidator.ErrorMessage = "";
                e.IsValid = true;
            }
        }
    }
}