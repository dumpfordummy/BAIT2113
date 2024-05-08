using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productID = Request.QueryString["id"];

            if (!IsPostBack)
            {
                if (productID != string.Empty && productID != null)
                {
                    ProductData pd = new ProductData();
                    Models.Product product = pd.GetProduct(int.Parse(productID));
                    lblPdtName.Text = product.Name;
                    lblPdtPrice.Text += product.Price.ToString("0.00");
                    lblPdtQty.Text += product.Quantity.ToString();

                    List<string> imgPathList = product.GetImagePathList();
                    imgPdt.ImageUrl = imgPathList[0];
                    imgBtnRepeater.DataSource = imgPathList;
                    imgBtnRepeater.DataBind();

                    ReviewData rd = new ReviewData();
                    List<Review> reviewsList = rd.GetReviews();
                    List<Review> currentPdtRev = new List<Review>();
                    ProductOrderData pod = new ProductOrderData();
                    List<Product_Order> product_OrdersList = pod.GetProductOrders();

                    foreach (Product_Order po in product_OrdersList)
                    {
                        foreach (Review r in reviewsList)
                        {
                            if (po.ReviewId == r.Id && po.ProductId == int.Parse(productID))
                            {
                                currentPdtRev.Add(r);
                            }
                        }
                    }
                }
                else
                {
                    throw new HttpException(404, "Not found");
                }
            }
        }

        protected void imgPdtBtn_Click(object sender, ImageClickEventArgs e)
        {
            string imgUrl = sender.GetType().GetProperty("ImageUrl").GetValue(sender).ToString();
            imgPdt.ImageUrl = imgUrl;
        }
    }
}