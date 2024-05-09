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
    public partial class AdminChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductOrderData productOrderData = new ProductOrderData();
            OrderData orderData = new OrderData();
            ProductData productData = new ProductData();
            UserData userData = new UserData();

            CategoryData categoryData = new CategoryData();
            List<Category> categoryList = categoryData.GetCategories();

            List<string> productCategoryCount = new List<string>();
            foreach (var category in categoryList)
            {
                productCategoryCount.Add(productData.GetProducts().Where(p => p.CategoryId == category.Id).Count().ToString());
            }
            string[] productCount = productCategoryCount.ToArray();
            string[] productCategories = categoryData.GetCategories().Select(c => c.Name).ToArray();

            List<string> categoryPopularityCount = new List<string>();
            foreach (var category in categoryList)
            {
                List<Models.Product> productList = productData.GetProducts().Where(p => p.CategoryId == category.Id).ToList();
                int categorycount = 0;
                foreach (var product in productList)
                {
                    categorycount += productOrderData.GetProductOrders().Where(po => po.ProductId == product.Id).Count();
                }
                categoryPopularityCount.Add(categorycount.ToString());
            }

            PaymentMethodData paymentMethodData = new PaymentMethodData();
            PaymentData paymentData = new PaymentData();
            List<PaymentMethod> paymentMethods = paymentMethodData.GetPaymentMethods();

            List<string> paymentMethodName = new List<string>();
            List<string> paymentMethodCount = new List<string>();

            foreach (var paymentMethod in paymentMethods)
            {

                paymentMethodCount.Add(paymentData.GetPayments().Where(p => p.PaymentMethodId == paymentMethod.Id).Count().ToString());
                paymentMethodName.Add(paymentMethod.Name);
            }

            ShippingMethodData shippingMethodData = new ShippingMethodData();
            DeliveryData deliveryData = new DeliveryData();

            List<string> shippingMethodName = new List<string>();
            List<string> shippingMethodCount = new List<string>();
            List<ShippingMethod> shippingMethods = shippingMethodData.GetShippingMethods();
            foreach (var shippingMethod in shippingMethods)
            {
                
                shippingMethodCount.Add(deliveryData.GetDeliveries().Where(d => d.ShippingMethodId == shippingMethod.Id).Count().ToString());
                shippingMethodName.Add(shippingMethod.Name);
            }


            ClientScript.RegisterArrayDeclaration("productCategories", ConvertStringArrayToString(productCategories));
            ClientScript.RegisterArrayDeclaration("productCount", ConvertStringArrayToString(productCount));
            ClientScript.RegisterArrayDeclaration("popularityCount", ConvertStringArrayToString(categoryPopularityCount.ToArray()));
            ClientScript.RegisterArrayDeclaration("paymentMethod", ConvertStringArrayToString(paymentMethodName.ToArray()));
            ClientScript.RegisterArrayDeclaration("paymentMethodCount", ConvertStringArrayToString(paymentMethodCount.ToArray()));
            ClientScript.RegisterArrayDeclaration("shippingMethod", ConvertStringArrayToString(shippingMethodName.ToArray()));
            ClientScript.RegisterArrayDeclaration("shippingMethodCount", ConvertStringArrayToString(shippingMethodCount.ToArray()));
        }

        private string ConvertStringArrayToString(string[] arr)
        {
            string result = "";
            for (int i = 0; i < arr.Length; i++)
            {
                result += $"\"{arr[i]}\"";
                if (i != arr.Length - 1)
                {
                    result += ", ";
                }
            }

            return result;
        }
    }
}