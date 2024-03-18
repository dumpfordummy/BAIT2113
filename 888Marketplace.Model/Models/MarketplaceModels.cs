using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _888MarketplaceApp.Core.Models
{
    public interface IUser
    {
        int Id { get; set; }
        string Username { get; set; }
        string Email { get; set; }
        string PasswordHash { get; set; }
        DateTime DateCreated { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
        string Phone { get; set; }
    }

    public partial class Administrator : IUser
    {

    }

    public partial class Buyer : IUser
    {

    }

    public partial class Seller : IUser
    {
        DateTime IUser.DateCreated { get; set; }
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
