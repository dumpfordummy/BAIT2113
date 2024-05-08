using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoryData cd = new CategoryData();
            List<Category> pdtCatList = cd.GetCategories();
            foreach (Category c in pdtCatList)
            {
                selPdtCatg.Items.Add(new ListItem(c.Name, c.Id.ToString()));
            }
        }

        protected void AddProductToDB(object sender, EventArgs e)
        {
            string fileNames = string.Empty;
            foreach (HttpPostedFile postedFile in imageUpl.PostedFiles)
            {
                string fileName = Path.GetFileName(postedFile.FileName);
                string folderUrl = "~/Content/Images/ProductImage/";
                postedFile.SaveAs(Server.MapPath(folderUrl) + fileName);
                fileNames += folderUrl + fileName + ";";
            }

            string prodName = txtPdtName.Text;
            string prodDesc = txtPdtDesc.Text;
            double prodPrice = double.Parse(inPdtPrice.Text);
            int prodQty = int.Parse(inPdtQty.Text);
            int prodCatID = int.Parse(selPdtCatg.Value);

            SessionManager session = SessionManager.Instance;
            User user = session.GetLoggedInUser(Request.Cookies);

            Models.Product product = new Models.Product
            {
                DateCreated = DateTime.Now,
                Name = prodName,
                Description = prodDesc,
                Price = prodPrice,
                Quantity = prodQty,
                CategoryId = prodCatID,
                SellerId = user.Id,
                ImagePaths = fileNames,
            };

            ProductData pd = new ProductData();
            pd.CreateProduct(product);
        }
    }
}