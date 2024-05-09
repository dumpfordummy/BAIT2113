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
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "888 Marketplace";

            CategoryData cd = new CategoryData();
            List<Category> catList = cd.GetCategories();
            featCtrlRepeater.DataSource = catList;
            featCtrlRepeater.DataBind();

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            bool shouldDisplayEdit = false;
            if (user != Models.User.empty)
                shouldDisplayEdit = true;
            ProductData pd = new ProductData();
            List<Models.Product> prodList = pd.GetProducts();
            var customProductList = prodList.Select(p => new
            {
                Product = p,
                ShouldDisplay = p.SellerId == user.Id && shouldDisplayEdit,

            });
            featProdRepeater.DataSource = customProductList;
            featProdRepeater.DataBind();
        }

        protected void searchProducts(object sender, EventArgs e)
        {
            string searchPdtName = txtSearch.Value;
            ProductData pd = new ProductData();
            List<Models.Product> matchedProducts = pd.GetProductsBySimilarName(searchPdtName);

            Session["MatchedProducts"] = matchedProducts;
            Response.Redirect("/Views/AllProduct.aspx");
        }
    }
}