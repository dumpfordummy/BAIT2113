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
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "888 Marketplace";

            CategoryData cd = new CategoryData();
            List<Category> catList = cd.GetCategories();
            featCtrlRepeater.DataSource = catList;
            featCtrlRepeater.DataBind();

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            bool shouldDisplayEdit = false;
            bool shouldDisplayATC = false;
            if (user != Models.User.empty)
                shouldDisplayEdit = true;
            ProductData pd = new ProductData();
            List<Models.Product> prodList = pd.GetProducts();
            var customProductList = prodList.Select(p => new
            {
                Product = p,
                ShouldDisplay = p.SellerId == user.Id && shouldDisplayEdit,
                ShouldDisplayATC = sessionManager.GetUserLoginState(Request.Cookies),
            });
            featProdRepeater.DataSource = customProductList;
            featProdRepeater.DataBind();
        }

        protected void searchProducts(object sender, EventArgs e)
        {
            string searchPdtName = txtSearch.Value;
            ProductData pd = new ProductData();
            List<Models.Product> matchedProducts = pd.GetProductsBySimilarName(searchPdtName);

            Session["MatchedProducts"] = matchedProducts;
            Response.Redirect("/Views/AllProduct.aspx");
        }

        protected void AddProductToCart(object sender, EventArgs e)
        {
            LinkButton toggleModalBtn = (LinkButton)sender;
            int productID = int.Parse(toggleModalBtn.CommandArgument);
            CartData cartData = new CartData();
            CartProductData cpData = new CartProductData();

            SessionManager session = SessionManager.Instance;
            User user = session.GetLoggedInUser(Request.Cookies);

            Models.Cart cart = cartData.GetCartByBuyerId(user.Id);

            Cart_Product cartProd = new Cart_Product
            {
                CartId = cart.Id,
                ProductId = productID,
                Quantity = 1
            };

            cpData.CreateCartProduct(cartProd);

            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
    }
}