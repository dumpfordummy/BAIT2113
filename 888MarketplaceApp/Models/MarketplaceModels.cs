using Microsoft.Ajax.Utilities;
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
        public static class UserRole
        {
            public static int Member = 1;
            public static int Staff = 2;
            public static int Admin = 3;
        }
    
        public class UserSessionModel
        {
            public int UserId;
            public string Username;
            public static UserSessionModel empty = new UserSessionModel(-1, "");

            public UserSessionModel(int id, string username)
            {
                UserId = id;
                Username = username;
            }

            public override bool Equals(object obj)
            {
                var x = (UserSessionModel)obj;
                return UserId == x.UserId && Username == x.Username;
            }

            public override int GetHashCode()
            {
                return this.GetHashCode();
            }
        }
    }

    public partial class Category
    {

    }

    public partial class Delivery
    {

    }

    public partial class Order
    {

    }

    public partial class Payment
    {

    }

    public partial class PaymentMethod
    {

    }

    public partial class Product
    {

    }

    public partial class Product_Order
    {

    }

    public partial class ShippingMethod
    {

    }
}
