using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Helper;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class Checkout : System.Web.UI.Page
    {
        public bool ShouldHaveVoucherDiscount = false;
        public bool ShouldHaveDeliveryFee = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitInputField();
            }

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);

            Models.Cart userCart = user.Carts.FirstOrDefault();
            CartData dataAccess = new CartData();
            Models.Cart userCartInDb = dataAccess.GetCart(userCart.Id);
            var customCartProductsDataSource = userCartInDb.Cart_Product.Select(cp => new
            {
                cp.Product,
                ProductQuantity = cp.Quantity,
                Amount = "RM" + (cp.Product.Price * cp.Quantity).ToString()
            }).Where(cp => !cp.Product.IsBan).ToList();

            ProductCheckoutRepeater.DataSource = customCartProductsDataSource;
            ProductCheckoutRepeater.DataBind();

            if (ProductCheckoutRepeater.Items.Count > 0)
            {
                ShouldHaveVoucherDiscount = true;
                ShouldHaveDeliveryFee = true;
            }

            ProcessSubTotal();

        }

        private void InitInputField()
        {
            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            UserData dataAccess = new UserData();
            user = dataAccess.GetUser(user.Id);

            Firstname.Text = user.FirstName;
            Lastname.Text = user.LastName;
            Address.Text = user.Address;
            Phone.Text = user.Phone;
            Email.Text = user.Email;
        }

        private bool IsInputValid()
        {
            return (phoneValidator.IsValid && AddressValidator.IsValid && EmailValidator.IsValid && FirstNameValidator.IsValid && LastNameValidator.IsValid && (radioDeliStd.Checked || radioDeliExp.Checked) && (radioCard.Checked || radioPaypal.Checked));
        }

        private double GetItemAmountSubtotal()
        {
            double subTotal = 0;

            foreach (RepeaterItem item in ProductCheckoutRepeater.Items)
            {
                Label itemTotal = (Label)item.FindControl("ItemAmount");
                double totals;
                if (double.TryParse(itemTotal.Text.Replace("RM", ""), out totals))
                {
                    subTotal += totals;
                }
            }
            return subTotal;
        }

        private void ProcessSubTotal()
        {
            double subTotal = GetItemAmountSubtotal();

            double voucherAmount = 0;
            if (IsUserHasVoucher(Request.Cookies))
            {
                voucherAmount = ShouldHaveDeliveryFee ? GetUserVoucherAmount(Request.Cookies) : 0;
                string voucherCode = Request.Cookies["vouchercode"].Value;
                VoucherDiscount.Text = $"Voucher {voucherCode} -RM{voucherAmount}";
                VoucherDiscount.Visible = true;
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

        public double GetUserVoucherAmount(HttpCookieCollection cookies)
        {
            string voucherCode = cookies["vouchercode"].Value;
            VoucherData dataAccess = new VoucherData();
            return (double)dataAccess.GetVoucherByCode(voucherCode).Amount;
        }

        public bool IsUserHasVoucher(HttpCookieCollection cookies)
        {
            return cookies["vouchercode"] != null;
        }

        public void PlaceOrder(object sender, EventArgs e)
        {
            if (!IsInputValid())
            {
                Result.Text = "Invalid Input";
                return;
            }
            PaymentMethod pm = new PaymentMethod();
            PaymentMethodData paymentMethodDataAccess = new PaymentMethodData();

            if (radioCard.Checked)
            {
                pm = paymentMethodDataAccess.GetPaymentMethodByName(PaymentMethod.CreditCard);
            }
            else
            {
                pm = paymentMethodDataAccess.GetPaymentMethodByName(PaymentMethod.Paypal);
            }

            ShippingMethod shippingMethod = new ShippingMethod();
            ShippingMethodData shippingMethodDataAccess = new ShippingMethodData();

            if (radioDeliStd.Checked)
            {
                shippingMethod = shippingMethodDataAccess.GetShippingMethodByName(ShippingMethod.Standard);
            }
            else
            {
                shippingMethod = shippingMethodDataAccess.GetShippingMethodByName(ShippingMethod.Express);
            }

            SessionManager sessionManager = SessionManager.Instance;
            User user = sessionManager.GetLoggedInUser(Request.Cookies);
            UserData userDataAccess = new UserData();
            user = userDataAccess.GetUser(user.Id);

            Billing billing = new Billing();
            billing.FirstName = Firstname.Text;
            billing.LastName = Lastname.Text;
            billing.Address = Address.Text;
            billing.Phone = Phone.Text;
            billing.Email = Email.Text;
            BillingData billingDataAccess = new BillingData();
            billingDataAccess.CreateBilling(billing);

            Payment payment = new Payment();
            payment.PaymentMethodId = pm.Id;
            payment.PaymentAmount = double.Parse(Total.Text.Replace("RM", ""));
            payment.PaymentDate = DateTime.Now;
            PaymentData paymentDataAccess = new PaymentData();
            paymentDataAccess.CreatePayment(payment);

            Delivery delivery = new Delivery();
            delivery.Address = Address.Text;
            delivery.Date = DateTime.Now;
            delivery.ShippingMethodId = shippingMethod.Id;
            delivery.EstimatedDeliveryDate = DateTime.Now.AddDays(5);
            delivery.Amount = 10;
            DeliveryData deliveryDataAccess = new DeliveryData();
            deliveryDataAccess.CreateDelivery(delivery);

            Order order = new Order();
            order.Amount = GetItemAmountSubtotal();
            order.Date = DateTime.Now;
            order.BuyerId = user.Id;
            order.BillingId = billing.Id;
            order.PaymentId = payment.Id;
            order.DeliveryId = delivery.Id;
            order.Status = Order.Processing;
            order.Note = Order.ProcessingNote;
            OrderData orderDataAccess = new OrderData();
            orderDataAccess.CreateOrder(order);

            if (ShouldHaveVoucherDiscount)
            {
                HttpCookie cookie = Request.Cookies["vouchercode"];
                if (cookie == null)
                {
                    ShouldHaveDeliveryFee = false;
                } else
                {
                    Voucher voucher = new Voucher();
                    string voucherCode = cookie.Value;
                    VoucherData voucherDataAccess = new VoucherData();
                    voucher = voucherDataAccess.GetVoucherByCode(voucherCode);
                    order.VoucherId = voucher.Id;
                    Voucher_Redemption vr = new Voucher_Redemption
                    {
                        BuyerId = user.Id,
                        VoucherId = voucher.Id
                    };
                    VoucherRedemptionData vrDataAccess = new VoucherRedemptionData();
                    vrDataAccess.CreateVoucherRedemption(vr);
                }
                
            }

            Models.Cart userCart = user.Carts.FirstOrDefault();
            CartData cartDataAccess = new CartData();
            Models.Cart userCartInDb = cartDataAccess.GetCart(userCart.Id);
            var customCartProduct = userCartInDb.Cart_Product.Select(cp => new
            {
                cp.Product,
                ProductQuantity = cp.Quantity
            }).Where(cp => !cp.Product.IsBan).ToList();

            foreach (var product in customCartProduct)
            {
                Product_Order productOrder = new Product_Order();
                productOrder.OrderId = order.Id;
                productOrder.ProductId = product.Product.Id;
                productOrder.Quantity = product.ProductQuantity;
                ProductOrderData poDataAccess = new ProductOrderData();
                poDataAccess.CreateProductOrder(productOrder);
            }

            Models.Cart cart = new Models.Cart();
            cart = cartDataAccess.GetCartByBuyerId(user.Id);
            CartProductData productDataAccess = new CartProductData();
            List<Cart_Product> cartProducts = productDataAccess.GetCartProductsByCartId(cart.Id);
            cartProducts.ForEach(cartProduct => { productDataAccess.DeleteCartProduct(cartProduct); });
            Response.Redirect("/Views/Users/PaymentSucc.aspx");
        }

        protected void PhoneValidator(object sender, ServerValidateEventArgs e)
        {
            string inputValue = e.Value;

            if (string.IsNullOrEmpty(inputValue))
            {
                phoneValidator.ErrorMessage = "The Phone field is required";
                e.IsValid = false;
            }
            else if (!Regex.IsMatch(inputValue, @"^\d+$"))
            {
                phoneValidator.ErrorMessage = "Phone number can only contains number";
                e.IsValid = false;
            }
            else if (inputValue.Length < 10 || inputValue.Length > 11)
            {
                phoneValidator.ErrorMessage = "Phone number must be between 10 and 11 numbers";
                e.IsValid = false;
            }
            else
            {
                phoneValidator.ErrorMessage = "";
                e.IsValid = true;
            }
        }
    }
}