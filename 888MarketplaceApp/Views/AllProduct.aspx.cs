using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class AllProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoryData cd = new CategoryData();
            List<Category> catList = cd.GetCategories();
            CategoryRepeater.DataSource = catList;
            CategoryRepeater.DataBind();

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            bool shouldDisplayEdit = false;
            if (user != Models.User.empty)
                shouldDisplayEdit = true;

            if (Session["MatchedProducts"] == null)
            {
                ProductData pd = new ProductData();
                List<Models.Product> prodList = pd.GetProducts();
                var customProductList = prodList.Select(p => new
                {
                    Product = p,
                    ShouldDisplay = p.SellerId == user.Id && shouldDisplayEdit,

                });
                ProductsRepeater.DataSource = customProductList;
                ProductsRepeater.DataBind();
            }
            else
            {
                List<Models.Product> prodList = (List<Models.Product>)Session["MatchedProducts"];
                var customProductList = prodList.Select(p => new
                {
                    Product = p,
                    ShouldDisplay = p.SellerId == user.Id && shouldDisplayEdit,

                });
                ProductsRepeater.DataSource = customProductList;
                ProductsRepeater.DataBind();
            }

        }
    }
}