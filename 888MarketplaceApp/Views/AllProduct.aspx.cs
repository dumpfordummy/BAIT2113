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

            ProductData pd = new ProductData();
            List<Models.Product> prodList = pd.GetProducts();
            ProductsRepeater.DataSource = prodList;
            ProductsRepeater.DataBind();

        }
    }
}