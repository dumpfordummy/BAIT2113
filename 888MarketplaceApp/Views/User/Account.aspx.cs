using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.IO;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            UserData userAccess = new UserData();
            var sessionManager = SessionManager.Instance;
            var cookies = Request.Cookies;

            var user = sessionManager.GetLoggedInUser(Request.Cookies);

            if (!IsPostBack)
            {
                InitInputField(user);
            }
            InitProfileAvatar(user.Id);
        }

        private void InitProfileAvatar(int userId)
        {
            const string DEFAULTIMAGEURL = "~/Content/Images/Admin/faces/face1.jpg";
            string id = userId.ToString();

            string userImagePath = $"~/Content/Images/UserImage/{id}.jpg";
            string serverPath = Server.MapPath(userImagePath);

            if (File.Exists(serverPath))
            {
                ProfileAvatar.ImageUrl = userImagePath;
            }
            else
            {
                ProfileAvatar.ImageUrl = DEFAULTIMAGEURL;
            }
        }

        private void InitInputField(User user)
        {
            Result.Text = "";
            hiddenId.Value = user.Id.ToString();
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
            else if (inputValue.Length < 4 || inputValue.Length > 20)
            {
                usernameValidator.ErrorMessage = "Length must be between 4 and 20 characters";
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

        private bool IsInputValid()
        {
            return (usernameValidator.IsValid && phoneValidator.IsValid && AddressValidator.IsValid && EmailValidator.IsValid && FirstNameValidator.IsValid && LastNameValidator.IsValid);
        }

        protected void SubmitEditAccount(object sender, EventArgs e)
        {
            UserData userAccess = new UserData();
            int id;

            if (!IsInputValid())
            {
                return;
            }

            if(!int.TryParse(hiddenId.Value, out id)) {
                Session["ErrorMessage"] = "Failed to parse id from string to int";
                Response.Redirect("~/Views/Error.aspx");
                return;
            }

            var sessionManager = SessionManager.Instance;
            var cookies = Request.Cookies;

            User currentUser = sessionManager.GetLoggedInUser(Request.Cookies);

            User user = userAccess.GetUser(id);
            user.Username = Username.Text;
            user.Email = Email.Text;
            user.FirstName = FirstName.Text;
            user.LastName = LastName.Text;
            user.Phone = Phone.Text;
            user.Address = Address.Text;

            if(currentUser.Username == user.Username || !userAccess.IsUsernameExist(user.Username))
            {
                if (ProfileAvatarUpload.HasFile)
                {
                    try
                    {
                        string filename = Path.GetFileName(ProfileAvatarUpload.FileName);
                        ProfileAvatarUpload.SaveAs(Server.MapPath($"/Content/Images/UserImage/{id}.jpg"));
                    }
                    catch (Exception)
                    {
                        Result.Text = "Error in processing images.";
                    }
                }

                try
                {
                    userAccess.UpdateUser(user);
                    Result.Text = "Update successfully";
                }
                catch (Exception)
                {
                    Result.Text = "Error in updating user information";
                }

            } else
            {
                Result.Text = "Username already existed, please choose a new username.";
            }
            
        }
    }
}