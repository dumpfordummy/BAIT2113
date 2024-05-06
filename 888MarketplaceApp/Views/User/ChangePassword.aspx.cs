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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Result.Text = "";
            }
        }

        protected void ChangePasswordClick(object sender, EventArgs e)
        {
            string oldPassword = OldPassword.Text;
            string newPassword = NewPassword.Text;
            var sessionManager = SessionManager.Instance;
            User loggedInUser = sessionManager.GetLoggedInUser(Request.Cookies); 
            UserData userAccess = new UserData();
            User user = userAccess.GetUser(loggedInUser.Id);

            if(IsInputValid() && PasswordHelper.VerifyHashedPassword(user.PasswordHash, oldPassword))
            {
                string newPasswordHash = PasswordHelper.HashPassword(newPassword);
                user.PasswordHash = newPasswordHash;
                userAccess.UpdateUser(user);
                Result.Text = "Password changed successfully";
            } else
            {
                Result.Text = "Incorrect old password";
            }
        }

        private bool IsInputValid()
        {
            return (passwordValidator.IsValid && confirmPasswordValidator.IsValid && oldPasswordValidator.IsValid);
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
            else if (NewPassword.Text != inputValue)
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