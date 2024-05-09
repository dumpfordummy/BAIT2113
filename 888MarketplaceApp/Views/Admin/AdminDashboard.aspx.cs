using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _888MarketplaceApp.Views
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductOrderData productOrderData = new ProductOrderData();
            OrderData orderData = new OrderData();
            double totalOrderAmount = 0;
            foreach (var order in orderData.GetOrders())
            {
                totalOrderAmount += order.Amount;
            }
            ProductData productData = new ProductData();
            UserData userData = new UserData();

            OrderCount.Text = productOrderData.GetProductOrders().Count.ToString();
            ProductSoldAmount.Text = totalOrderAmount.ToString();
            ProductListedCount.Text = productData.GetProducts().Where(p => !p.IsBan).ToList().Count.ToString();
            UserCount.Text = userData.GetUsers().Count.ToString();

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
                int count = 0;
                foreach (var product in productList)
                {
                    count += productOrderData.GetProductOrders().Where(po => po.ProductId == product.Id).Count();
                }
                categoryPopularityCount.Add(count.ToString());
            }

            // Register the array declaration
            ClientScript.RegisterArrayDeclaration("productCategories", ConvertStringArrayToString(productCategories));
            ClientScript.RegisterArrayDeclaration("productCount", ConvertStringArrayToString(productCount));
            ClientScript.RegisterArrayDeclaration("popularityCount", ConvertStringArrayToString(categoryPopularityCount.ToArray()));
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