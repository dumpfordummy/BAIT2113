﻿using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace _888MarketplaceApp.Models
{
    public partial class User
    {
        public static User empty = new User();


        public bool IsUserCustomer()
        {
            return Userrole1.Id == Models.Userrole.Customer;
        }
        public bool IsUserAdmin()
        {
            return Userrole1.Id == Models.Userrole.Admin;
        }
    }

    public partial class Userrole
    {
        public static int Admin = 1;
        public static int Customer = 2;
    }

    public partial class Category
    {

    }

    public partial class Delivery
    {

    }

    public partial class Order
    {
        public static string Processing = "Processing";
        public static string ProcessingNote = "We are processing your order";
        public static string Delivering = "Delivering";
        public static string DeliveringNote = "Your order is on the way";
        public static string Completed = "Completed";
        public static string CompletedNote = "Your order is completed";
        public static string Refunded = "Refunded";
        public static string RefundedNote = "Your order is refunded";
        public static string Canceled = "Canceled";
        public static string CanceledNote = "Your order is canceled";
    }

    public partial class Payment
    {

    }

    public partial class PaymentMethod
    {

    }

    public partial class Product
    {
        public string ProductCategory;

        public List<string> GetImagePathList()
        {
            List<string> imagePaths = new List<string>();

            if (!string.IsNullOrEmpty(ImagePaths))
            {
                string[] paths = ImagePaths.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string path in paths)
                {
                    string trimmedPath = path.Trim();

                    imagePaths.Add(trimmedPath);
                }
            }

            return imagePaths;
        }
    }

    public partial class Product_Order
    {

    }

    public partial class ShippingMethod
    {

    }

    public partial class PaymentMethod
    {
        public static string CreditCard = "Credit Card";
        public static string Paypal = "Paypal";
    }

    public partial class ShippingMethod
    {
        public static string Fedex = "FEDEX";
        public static string DHL = "DHL";
    }
}
