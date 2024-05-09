using _888MarketplaceApp.DataAccess;
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

            if (Session["MatchedProducts"] == null)
            {
                ProductData pd = new ProductData();
                List<Models.Product> prodList = pd.GetProducts();
                ProductsRepeater.DataSource = prodList;
                ProductsRepeater.DataBind();
            }
            else {
                List<Models.Product> prodList = (List<Models.Product>)Session["MatchedProducts"];
                ProductsRepeater.DataSource = prodList;
                ProductsRepeater.DataBind();
            }

        }
    }
}