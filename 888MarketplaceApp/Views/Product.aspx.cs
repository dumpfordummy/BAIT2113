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
            Result.Text = "";
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

            if (inPurchaseQty.Text == string.Empty)
            {
                purchaseQtyVal.IsValid = false;
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

            ProductData productData = new ProductData();

            if (productData.GetProduct(int.Parse(productID)).Quantity < int.Parse(inPurchaseQty.Text))
            {
                Result.Text = "Invalid quantity";
                return;
            }

            CartProductData cartProductData = new CartProductData();
            
            if(cartProductData.GetCartProducts().Any(x => x.CartId == cart.Id && x.ProductId == int.Parse(productID)))
            {
                Result.Text = "Item already in cart";
                return;
            }

            cpData.CreateCartProduct(cartProd);
        
        }
    }
}