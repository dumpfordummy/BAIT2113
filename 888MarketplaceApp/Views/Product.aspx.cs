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
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productID = Request.QueryString["id"];

            SessionManager sm = SessionManager.Instance;
            if (!sm.GetUserLoginState(Request.Cookies))
            {
                AddToCartBtn.Visible = false;
            }

            if (!IsPostBack)
            {
                if (productID != string.Empty && productID != null)
                {
                    ProductData pd = new ProductData();
                    Models.Product product = pd.GetProduct(int.Parse(productID));
                    lblPdtName.Text = product.Name;
                    lblPdtPrice.Text += product.Price.ToString("0.00");
                    lblStockQty.Text += product.Quantity.ToString();
                    pdtDesc.InnerText = product.Description;
                    

                    if (product.Quantity <= 0)
                    {
                        AddToCartBtn.Visible = false;
                    }

                    List<string> imgPathList = product.GetImagePathList();
                    imgPdt.ImageUrl = imgPathList[0];
                    imgBtnRepeater.DataSource = imgPathList;
                    imgBtnRepeater.DataBind();

                    prgPdtMap.InnerText = "Category > " + product.Category.Name + " > " + product.Name;

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
                    Session["ErrorMessage"] = "Product not found.";
                    Response.Redirect("/Views/Error.aspx");
                }
            }
        }

        protected void imgPdtBtn_Click(object sender, ImageClickEventArgs e)
        {
            string imgUrl = sender.GetType().GetProperty("ImageUrl").GetValue(sender).ToString();
            imgPdt.ImageUrl = imgUrl;
        }

        protected void AddProductToCart(object sender, EventArgs e)
        {
            string productID = Request.QueryString["id"];

            if (!purchaseQtyVal.IsValid)
            {
                return;
            }

            CartData cartData = new CartData();
            CartProductData cpData = new CartProductData();

            SessionManager session = SessionManager.Instance;
            User user = session.GetLoggedInUser(Request.Cookies);

            Models.Cart cart = cartData.GetCartByBuyerId(user.Id);

            Cart_Product cartProd = new Cart_Product
            {
                CartId = cart.Id,
                ProductId = int.Parse(productID),
                Quantity = int.Parse(inPurchaseQty.Text)
            };

            cpData.CreateCartProduct(cartProd);
        
        }
    }
}