using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Account : System.Web.UI.Page
    {
        User user = Models.User.empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            UserData userAccess = new UserData();
            var sessionManager = SessionManager.Instance;
            var cookies = Request.Cookies;

            user = sessionManager.GetLoggedInUser(Request.Cookies);
            InitInputField();
        }

        private void InitInputField()
        {
            Username.Text = user.Username;
            Email.Text = user.Email;
            FirstName.Text = user.FirstName;
            LastName.Text = user.LastName;
            Phone.Text = user.Phone;
            Address.Text = user.Address;
        }

        protected void UsernameValidator(object sender, ServerValidateEventArgs e)
        {
            string inputValue = e.Value;
            if (string.IsNullOrEmpty(inputValue))
            {
                usernameValidator.ErrorMessage = "The Username field is required";
                e.IsValid = false;
            }
            else if (inputValue.Length < 6 || inputValue.Length > 20)
            {
                usernameValidator.ErrorMessage = "Length must be between 6 and 20 characters";
                e.IsValid = false;
            }
            else
            {
                usernameValidator.ErrorMessage = "";
                e.IsValid = true;
            }
        }

        protected void PhoneValidator(object sender, ServerValidateEventArgs e)
        {
            string inputValue = e.Value;

            if (string.IsNullOrEmpty(inputValue))
            {
                phoneValidator.ErrorMessage = "The Phone field is required";
                e.IsValid = false;
            }
            else if (!Regex.IsMatch(inputValue, @"^\d+$"))
            {
                phoneValidator.ErrorMessage = "Phone number can only contains number";
                e.IsValid = false;
            }
            else if (inputValue.Length < 10 || inputValue.Length > 11)
            {
                phoneValidator.ErrorMessage = "Phone number must be between 10 and 11 numbers";
                e.IsValid = false;
            }
            else
            {
                phoneValidator.ErrorMessage = "";
                e.IsValid = true;
            }
        }

        protected void SubmitEditAccount(object sender, EventArgs e)
        {

        }
    }
}