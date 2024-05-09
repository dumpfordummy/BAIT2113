using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp
{
    public partial class AdminTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                ProductData pd = new ProductData();
                List<Product> allProduct = pd.GetProducts();

                AdminTableRepeater.DataSource = allProduct;
                AdminTableRepeater.DataBind();
            }
        }

        protected void viewClick(object sender, EventArgs e)
        {
            Button viewBtn = (Button)sender;
            String ProductId = viewBtn.CommandArgument;

            String Destination = $"/Product?Id={ProductId}";
            Response.Redirect(Destination);
        }

        protected void banClick(object sender, EventArgs e)
        {

        }


    }
}