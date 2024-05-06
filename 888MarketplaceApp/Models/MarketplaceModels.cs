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
        public static User empty = new User();


        public bool IsUserMember()
        {
            return Userrole1.Id == Models.Userrole.Member;
        }
        public bool IsUserAdmin()
        {
            return Userrole1.Id == Models.Userrole.Admin;
        }
    }

    public partial class Userrole
    {
        public static int Member = 1;
        public static int Admin = 2;
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
