using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoryData categoryData = new CategoryData();
            List<Category> categories = categoryData.GetCategories();

            CategoryRepeater.DataSource = categories;
            CategoryRepeater.DataBind();
        }

        protected void DeleteCategory(object sender, EventArgs e)
        {
            Button closeButton = (Button)sender;
            int id = int.Parse(closeButton.CommandArgument);
            ProductData pd = new ProductData();
            if (pd.GetProducts().Where(p => p.CategoryId == id).Count() != 0)
            {
                Result.Text = "Category contain product, cannot delete";
                return;
            }

            CategoryData categoryData = new CategoryData();
            var cat = categoryData.GetCategory(id);
            categoryData.DeleteCategory(cat);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void AddCategoryToDB(object sender, EventArgs e)
        {
            CategoryData dataAccess = new CategoryData();

            if(dataAccess.GetCategoryByName(catName.Text) != null)
            {
                Result.Text = "Category existed!";
                return;
            }

            var category = new Category { Name = catName.Text, Description = catDesc.Text };

            dataAccess.CreateCategory(category);
        }
    }
}