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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productID = Request.QueryString["Id"];
            
            CategoryData cd = new CategoryData();
            List<Category> pdtCatList = cd.GetCategories();
            foreach (Category c in pdtCatList)
            {
                selPdtCatg.Items.Add(new ListItem(c.Name, c.Id.ToString()));
            }
            if (!IsPostBack)
            {
                actionMessages.Visible = false;
                hiddenProdID.Value = productID;
                if (productID != string.Empty && productID != null)
                {
                    ProductData pd = new ProductData();
                    Models.Product product = pd.GetProduct(int.Parse(productID));
                    txtPdtName.Text = product.Name;
                    inPdtPrice.Text += product.Price.ToString("0.00");
                    inPdtQty.Text += product.Quantity.ToString();
                    txtPdtDesc.Text = product.Description;
                    int categoryId = product.CategoryId;

                    List<string> imgPathList = product.GetImagePathList();
                    imgRepeater.DataSource = imgPathList;
                    imgRepeater.DataBind();

                    selPdtCatg.SelectedIndex = selPdtCatg.Items.IndexOf(selPdtCatg.Items.FindByValue(categoryId.ToString()));
                }
            }
            
        }

        protected void editProduct(object sender, EventArgs e)
        {
            string productID = hiddenProdID.Value;
            ProductData pd = new ProductData();
            Models.Product product = pd.GetProduct(int.Parse(productID));

            string fileNames = string.Empty;
            foreach (HttpPostedFile postedFile in imageUpl.PostedFiles)
            {
                if (postedFile.FileName != string.Empty && postedFile.FileName != null)
                {
                    string fileName = Path.GetFileName(postedFile.FileName);
                    string folderUrl = "/Content/Images/ProductImage/";
                    postedFile.SaveAs(Server.MapPath(folderUrl) + fileName);
                    fileNames += folderUrl + fileName + ";";
                }
            }

            string prodName = txtPdtName.Text;
            string prodDesc = txtPdtDesc.Text;
            double prodPrice = double.Parse(inPdtPrice.Text);
            int prodQty = int.Parse(inPdtQty.Text);
            int prodCatID = int.Parse(selPdtCatg.Value);

            product.Name = prodName;
            product.Description = prodDesc;
            product.Price = prodPrice;
            product.Quantity = prodQty;
            product.CategoryId = prodCatID;
            product.ImagePaths = fileNames;
            try
            {
                pd.UpdateProduct(product);

                actionMessages.Visible = true;
                cardActionMessage.Attributes.Add("style", "background-color: #29E275; border: none; padding: 10px; width: 60%");
                resultMessage.Text = "Product is edited successfully!";
                resultMessage.ForeColor = System.Drawing.Color.White;
                
            } catch {
                actionMessages.Visible = true;
                cardActionMessage.Attributes.Add("style", "background-color: #29E275; border: none; padding: 10px; width: 60%");
                resultMessage.Text = "Error! Product is not edited.";
                resultMessage.ForeColor = System.Drawing.Color.White;
            }
        }

        protected void delImgFromList(object sender, EventArgs e)
        {
            string productID = Request.QueryString["Id"];
            ProductData pd = new ProductData();
            Models.Product product = pd.GetProduct(int.Parse(productID));

            selPdtCatg.SelectedIndex = selPdtCatg.Items.IndexOf(selPdtCatg.Items.FindByValue(product.CategoryId.ToString()));

            Button cancelBtn = (Button)sender;
            string imgPath = cancelBtn.CommandArgument.ToString();

            List<string> imgPathList = product.GetImagePathList();
            imgPathList.Remove(imgPath);
            imgRepeater.DataSource = imgPathList;
            imgRepeater.DataBind();
        }
    }
}