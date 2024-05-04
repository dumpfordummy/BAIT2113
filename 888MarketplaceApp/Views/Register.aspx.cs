using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure.Design;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    /// <summary>
    /// 1. implement ur view interface
    /// 2. initialize ur presenter on Page_Load
    /// </summary>
    public partial class Register : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            string username = Username.Text;
            string email = Email.Text;
            string password = Password.Text;
            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string phone = Phone.Text;
            string address = Address.Text;
            string passwordHash = PasswordHelper.HashPassword(password);

            User user = new User
            {
                Username = username,
                Email = email,
                PasswordHash = passwordHash,
                FirstName = firstName,
                LastName = lastName,
                Phone = phone,
                Address = address,
                Userrole = Models.User.UserRole.Member,
                DateCreated = DateTime.Now
            };

            UserData userAccess = new UserData();

            User userCreated = userAccess.CreateUser(user);

            if (userCreated != null)
            {
                RegisterSuccess();
            }
            else
            {
                RegisterFailed();
            }
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
            else {
                usernameValidator.ErrorMessage = "";
                e.IsValid = true;
            }
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
            else if(Password.Text != inputValue)
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

        public void RegisterSuccess()
        {
            Result.Text = "Account registered successfully, redirecting to home page";
            string script = @"<script type='text/javascript'>
                        setTimeout(function() {
                            window.location.href = '/';
                        }, 1000);
                      </script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", script);
        }

        public void RegisterFailed()
        {
            Result.Text = "Account created failed.";
        }
    }
}