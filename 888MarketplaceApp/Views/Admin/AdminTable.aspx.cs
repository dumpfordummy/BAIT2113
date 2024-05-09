using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using _888MarketplaceApp.Views;
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
                List<Models.Product> allProduct = pd.GetProducts().Where(p => !p.IsBan).ToList();

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
            ProductData pd = new ProductData();
            Button banBtn = (Button)sender;
            int ProductId = int.Parse(banBtn.CommandArgument);
            Models.Product product = pd.GetProduct(ProductId);
            product.IsBan = true;
            pd.UpdateProduct(product);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void search(object sender, EventArgs e)
        {
            String userInput = searchBox.Text;

            ProductData pd = new ProductData();
            List<Models.Product> productName = pd.GetProductsBySimilarName(userInput);

            AdminTableRepeater.DataSource = productName;
            AdminTableRepeater.DataBind();

        }
    }
}