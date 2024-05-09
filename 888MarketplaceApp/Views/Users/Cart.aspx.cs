using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Cart : System.Web.UI.Page
    {
        public bool ShouldHaveVoucherDiscount = false;
        public bool ShouldHaveDeliveryFee = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            CartData dataAccess = new CartData();
            Models.Cart userCartInDb = dataAccess.GetCart(userCart.Id);
            var customCartProductsDataSource = userCartInDb.Cart_Product.Select(cp => new
            {
                cp.Product,
                ImagePath = cp.Product.GetImagePathList()[0],
                CartQuantity = cp.Quantity,
                CartAmount = "RM" + (cp.Product.Price * cp.Quantity).ToString()
            }).Where(cp => !cp.Product.IsBan).ToList();

            CartRepeater.DataSource = customCartProductsDataSource;
            CartRepeater.DataBind();

            if (CartRepeater.Items.Count > 0)
            {
                ShouldHaveVoucherDiscount = true;
                ShouldHaveDeliveryFee = true;
            }

            ProcessSubTotal();
        }

        protected void ProcessSubTotal()
        {
            double subTotal = 0;

            foreach (RepeaterItem item in CartRepeater.Items)
            {
                Label cartItemTotal = (Label)item.FindControl("CartItemTotal");
                double itemTotal;
                if (double.TryParse(cartItemTotal.Text.Replace("RM", ""), out itemTotal))
                {
                    subTotal += itemTotal;
                }
            }

            double voucherAmount = 0;
            if (IsUserHasVoucher(Request.Cookies))
            {
                HttpCookie cookie = Request.Cookies["vouchercode"];
                if (cookie == null)
                {
                    ShouldHaveDeliveryFee = false;
                } else
                {
                    voucherAmount = ShouldHaveDeliveryFee ? GetUserVoucherAmount(cookie) : 0;
                    string voucherCode = cookie.Value;
                    VoucherDiscount.Text = $"Voucher {voucherCode} -RM{voucherAmount}";
                    VoucherDiscount.Visible = true;
                }
                
            }

            double deliveryFee = ShouldHaveDeliveryFee ? 10 : 0;
            DeliveryFee.Text = $"RM{deliveryFee}";

            double total = subTotal + deliveryFee - voucherAmount;
            if (total < 0)
            {
                total = 0;
            }
            SubTotal.Text = $"RM{subTotal}";
            Total.Text = $"RM{total}";
        }

        public double GetUserVoucherAmount(HttpCookie cookie)
        {
            string voucherCode = cookie.Value;
            VoucherData dataAccess = new VoucherData();
            return dataAccess.GetVoucherByCode(voucherCode).Amount;
        }

        public bool IsUserHasVoucher(HttpCookieCollection cookies)
        {
            return cookies["vouchercode"] != null;
        }

        protected void ApplyCoupon_Click(object sender, EventArgs e)
        {
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            CartData cartDataAccess = new CartData();
            Models.Cart userCartInDb = cartDataAccess.GetCart(userCart.Id);

            string couponCode = Coupon.Text;
            VoucherData voucherDataAccess = new VoucherData();
            VoucherRedemptionData voucherRedemptionDataAccess = new VoucherRedemptionData();

            Voucher voucher = voucherDataAccess.GetVoucherByCode(couponCode);

            if (userCartInDb.Cart_Product.ToList().Count == 0)
            {
                Result.Text = "You dont have item in your cart";
                return;
            }

            if (voucher == null)
            {
                Result.Text = "Invalid Voucher Code";
                HttpCookie cookie = new HttpCookie("vouchercode");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.SetCookie(cookie);
                Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
                return;
            }
            Voucher_Redemption voucherRedemption = voucherRedemptionDataAccess.GetVoucherRedemptionByVoucherUser(voucher.Id, user.Id);
            if (voucherRedemption != null)
            {
                Result.Text = "You've already redeemed this voucher code";
                HttpCookie cookie = new HttpCookie("vouchercode");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.SetCookie(cookie);
                Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
                return;
            }

            HttpCookie voucherCookie = new HttpCookie("vouchercode", voucher.Code);
            voucherCookie.Expires = DateTime.UtcNow.Add(TimeSpan.FromHours(24));
            Response.SetCookie(voucherCookie);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void DeleteCartItem(object sender, EventArgs e)
        {
            Button closeButton = (Button)sender;
            int productId = int.Parse(closeButton.CommandArgument);
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            UserData userDataAccess = new UserData();
            user = userDataAccess.GetUser(user.Id);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            Cart_Product cartProduct = userCart.Cart_Product.Where(cp => cp.ProductId == productId).FirstOrDefault();
            CartProductData dataAccess = new CartProductData();
            dataAccess.DeleteCartProduct(cartProduct);
            Response.Redirect("/Views/Users/CartConfirmation.aspx");
        }

        protected void DecreaseQuantity_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] values = btn.CommandArgument.Split(',');
            int productId = int.Parse(values[0]);
            int newQuantity = int.Parse(values[1]) - 1;
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            UserData userDataAccess = new UserData();
            user = userDataAccess.GetUser(user.Id);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            Cart_Product cartProduct = userCart.Cart_Product.Where(cp => cp.ProductId == productId && !cp.Product.IsBan).FirstOrDefault();
            cartProduct.Quantity = newQuantity;
            CartProductData dataAccess = new CartProductData();

            if (cartProduct.Quantity <= 0)
            {
                dataAccess.DeleteCartProduct(cartProduct);
            }
            else
            {
                dataAccess.UpdateCartProduct(cartProduct);

            }
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }

        protected void IncreaseQuantity_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] values = btn.CommandArgument.Split(',');
            int productId = int.Parse(values[0]);
            int newQuantity = int.Parse(values[1]) + 1;
            ProductData productData = new ProductData();

            if (productData.GetProduct(productId).Quantity < newQuantity)
            {
                return;
            }

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            UserData userDataAccess = new UserData();
            user = userDataAccess.GetUser(user.Id);
            


            Models.Cart userCart = user.Carts.FirstOrDefault();
            Cart_Product cartProduct = userCart.Cart_Product.Where(cp => cp.ProductId == productId && !cp.Product.IsBan).FirstOrDefault();
            cartProduct.Quantity = newQuantity;
            CartProductData dataAccess = new CartProductData();
            dataAccess.UpdateCartProduct(cartProduct);
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
    }
}