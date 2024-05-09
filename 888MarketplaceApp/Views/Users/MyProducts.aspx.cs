using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views.Users
{
    public partial class MyProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                deleteConfirmPopup.Visible = false;
            }
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            
            ProductData pd = new ProductData();
            List<Models.Product> prodList = pd.GetProducts();
            var customProductList = prodList.Where(p => p.SellerId == user.Id).Select(p => new
            {
                Product = p,
            });
            myProdList.DataSource = customProductList;
            myProdList.DataBind();
        }

        protected void toggleModalOn(object sender, EventArgs e)
        {
            deleteConfirmPopup.Visible = true;
            LinkButton toggleModalBtn = (LinkButton)sender;
            int productID = int.Parse(toggleModalBtn.CommandArgument);
            ProductData productData = new ProductData();
            lblDelConfirm.Text = "Do you wish to delete this product: " + productData.GetProduct(productID).Name + "?";
            delProductID.Value = productID.ToString();
        }

        protected void toggleModalOff(object sender, EventArgs e)
        {
            deleteConfirmPopup.Visible = false;
        }

        protected void deleteProduct(object sender, EventArgs e)
        {
            toggleModalOff(sender, e);
            int productID = int.Parse(delProductID.Value);

            ProductData productData = new ProductData();
            Models.Product product = productData.GetProduct(productID);
            productData.DeleteProduct(product);

            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
    }
}