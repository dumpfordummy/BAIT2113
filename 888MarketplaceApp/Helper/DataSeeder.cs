using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.Helper
{
    public class DataSeeder
    {

        public static void Seed()
        {
            SeedBilling();
            SeedVouchers();
            SeedUserroles();
            SeedCategories();
            SeedPaymentMethods();
            SeedShippingMethods();
            SeedUsers();
            SeedCarts();
            SeedProducts();
            SeedCartProducts();
            SeedPayment();
            SeedDeliveries();
            SeedOrders();
            SeedProductOrders();
        }

        private static void SeedUserroles()
        {
            UserroleData dataAccess = new UserroleData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var userRoles = new List<Userrole>
            {
                new Userrole { Role = "Admin" },
                new Userrole { Role = "Customer" }
            };

            foreach (var userrole in userRoles)
            {
                dataAccess.CreateUserrole(userrole);
            }
        }

        private static void SeedUsers()
        {
            UserData dataAccess = new UserData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var users = new List<User>
            {
                new User
                {
                    Username = "admin",
                    Email = "admin@example.com",
                    PasswordHash = PasswordHelper.HashPassword("admin"),
                    DateCreated = DateTime.Now,
                    FirstName = "Admin",
                    LastName = "Lee",
                    Phone = "1234567890",
                    Address = "Admin Address",
                    VerificationToken = null,
                    VerificationExpire = null,
                    Userrole = Userrole.Admin,
                    AccountVerified = true
                },
                new User
                {
                    Username = "customer",
                    Email = "customer@example.com",
                    PasswordHash = PasswordHelper.HashPassword("customer"),
                    DateCreated = DateTime.Now,
                    FirstName = "John",
                    LastName = "Doe",
                    Phone = "0987654321",
                    Address = "Customer Address",
                    VerificationToken = null,
                    VerificationExpire = null,
                    Userrole = Userrole.Customer,
                    AccountVerified = true
                },
                new User
                {
                    Username = "dumpfordummy",
                    Email = "cyhoocsgo@gmail.com",
                    PasswordHash = PasswordHelper.HashPassword("asdf1234"),
                    DateCreated = DateTime.Now,
                    FirstName = "Chun Yuan",
                    LastName = "Hoo",
                    Phone = "0192009289",
                    Address = "PV13 Block B Setapak",
                    VerificationToken = null,
                    VerificationExpire = null,
                    Userrole = Userrole.Customer,
                    AccountVerified = true
                }
            };

            foreach (var user in users)
            {
                dataAccess.CreateUser(user);
            }
        }

        private static void SeedShippingMethods()
        {
            ShippingMethodData dataAccess = new ShippingMethodData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var shippingMethods = new List<ShippingMethod>
            {
                new ShippingMethod { Name = ShippingMethod.DHL, Description = "DHL shipping" },
                new ShippingMethod { Name = ShippingMethod.Fedex, Description = "Fedex shipping" }
            };

            foreach (var shippingMethod in shippingMethods)
            {
                dataAccess.CreateShippingMethod(shippingMethod);
            }
        }

        private static void SeedCategories()
        {
            CategoryData dataAccess = new CategoryData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var categories = new List<Category>
            {
                new Category { Name = "Electronics", Description = "Electronics products" },
                new Category { Name = "Clothing", Description = "Clothing products" }
            };

            foreach (var category in categories)
            {
                dataAccess.CreateCategory(category);
            }
        }

        private static void SeedProducts()
        {
            ProductData dataAccess = new ProductData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var products = new List<Product>
            {
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Asus ROG Strix SCAR 17",
                    Description = "High-performance laptop",
                    Price = 999.99,
                    Quantity = 10,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/1_1.jpg;/Content/Images/ProductImage/1_2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Polo T-shirt",
                    Description = "Casual T-shirt",
                    Price = 19.99,
                    Quantity = 50,
                    SellerId = 2,
                    CategoryId = 2,
                    ImagePaths = "/Content/Images/ProductImage/2_1.jpg;/Content/Images/ProductImage/2_2.jpg",
                    IsBan = false
                },

                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Apple MacBook Pro 16-inch",
                    Description = "Professional laptop",
                    Price = 2399.99,
                    Quantity = 15,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/3-1.jpg;/Content/Images/ProductImage/3-2.jpg",
                    IsBan = false
                },

                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Nike Air Zoom Pegasus 38",
                    Description = "Running shoes",
                    Price = 129.99,
                    Quantity = 25,
                    SellerId = 2,
                    CategoryId = 2,
                    ImagePaths = "/Content/Images/ProductImage/4-1.jpg;/Content/Images/ProductImage/4-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Canon EOS R5",
                    Description = "Mirrorless camera",
                    Price = 3899.99,
                    Quantity = 10,
                    SellerId = 3,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/5-1.jpg;/Content/Images/ProductImage/5-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Amazon Echo Dot (4th Gen)",
                    Description = "Smart speaker with Alexa",
                    Price = 49.99,
                    Quantity = 40,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/6-1.jpg;/Content/Images/ProductImage/6-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Dell UltraSharp U2720Q",
                    Description = "27-inch 4K monitor",
                    Price = 649.99,
                    Quantity = 20,
                    SellerId = 1,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/7-1.jpg;/Content/Images/ProductImage/7-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Cuisinart DCC-3200",
                    Description = "Programmable coffee maker",
                    Price = 89.99,
                    Quantity = 30,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/8-1.jpg;/Content/Images/ProductImage/8-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Logitech MX Master 3",
                    Description = "Wireless mouse",
                    Price = 99.99,
                    Quantity = 35,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/9-1.jpg;/Content/Images/ProductImage/9-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Instant Pot Duo Evo Plus",
                    Description = "10-in-1 pressure cooker",
                    Price = 119.99,
                    Quantity = 25,
                    SellerId = 2,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/10-1.jpg;/Content/Images/ProductImage/10-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Fujifilm Instax Mini 11",
                    Description = "Instant camera",
                    Price = 69.99,
                    Quantity = 15,
                    SellerId = 1,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/11-1.jpg;/Content/Images/ProductImage/11-2.jpg",
                    IsBan = false
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Apple Watch Series 7",
                    Description = "Smartwatch",
                    Price = 399.99,
                    Quantity = 20,
                    SellerId = 3,
                    CategoryId = 1,
                    ImagePaths = "/Content/Images/ProductImage/12-1.jpg;/Content/Images/ProductImage/12-2.jpg",
                    IsBan = false
                }
            };

            foreach (var product in products)
            {
                dataAccess.CreateProduct(product);
            }
        }

        private static void SeedOrders()
        {
            OrderData dataAccess = new OrderData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var orders = new List<Order>
            {
                new Order
                {
                    Date = DateTime.Now,
                    Amount = 2019.97,
                    Note = Order.CompletedNote,
                    Status = Order.Completed,
                    BuyerId = 3,
                    PaymentId = 1,
                    DeliveryId = 1,
                    VoucherId = null,
                    BillingId = 1
                }
            };

            foreach (var order in orders)
            {
                dataAccess.CreateOrder(order);
            }
        }

        private static void SeedPaymentMethods()
        {
            PaymentMethodData dataAccess = new PaymentMethodData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var paymentMethods = new List<PaymentMethod>
            {
                new PaymentMethod { Name = PaymentMethod.CreditCard, Description = "Payment via credit card" },
                new PaymentMethod { Name = PaymentMethod.Paypal, Description = "Payment via PayPal" }
            };

            foreach (var paymentMethod in paymentMethods)
            {
                dataAccess.CreatePaymentMethod(paymentMethod);
            }
        }

        private static void SeedVouchers()
        {
            VoucherData dataAccess = new VoucherData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var vouchers = new List<Voucher>
            {
                new Voucher { Code = "VOUCHERRM10", Amount = 10.00 },
                new Voucher { Code = "VOUCHERRM20", Amount = 20.00 }
            };

            foreach (var voucher in vouchers)
            {
                dataAccess.CreateVoucher(voucher);
            }
        }

       

        private static void SeedCarts()
        {
            CartData dataAccess = new CartData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var carts = new List<Cart>
            {
                new Cart { BuyerId = 1 },
                new Cart { BuyerId = 2 },
                new Cart { BuyerId = 3 }
            };
            foreach (var cart in carts)
            {
                dataAccess.CreateCart(cart);
            }
        }

        private static void SeedDeliveries()
        {
            DeliveryData dataAccess = new DeliveryData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var deliveries = new List<Delivery>
            {
                new Delivery
                {
                    Address = "Sample address",
                    Date = DateTime.Now,
                    ShippingMethodId = 1,
                    EstimatedDeliveryDate = DateTime.Now.AddDays(5),
                    Amount = 10
                }
            };

            foreach (var delivery in deliveries)
            {
                dataAccess.CreateDelivery(delivery);
            }
        }

        private static void SeedPayment()
        {
            PaymentData dataAccess = new PaymentData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var payments = new List<Payment>
            {
                new Payment
                {
                    PaymentAmount = 99.99,
                    PaymentDate = DateTime.Now,
                    PaymentMethodId = 1
                }
            };

            foreach (var payment in payments)
            {
                dataAccess.CreatePayment(payment);
            }
        }

        private static void SeedProductOrders()
        {
            ProductOrderData dataAccess = new ProductOrderData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var productOrders = new List<Product_Order>
            {
                new Product_Order
                {
                    OrderId = 1,
                    ProductId = 1,
                    Quantity = 2
                },
                new Product_Order
                {
                    OrderId = 1,
                    ProductId = 2,
                    Quantity = 1
                }
            };

            foreach (var productOrder in productOrders)
            {
                dataAccess.CreateProductOrder(productOrder);
            }
        }

        private static void SeedCartProducts()
        {
            CartProductData dataAccess = new CartProductData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var cartProducts = new List<Cart_Product>
            {
                new Cart_Product
                {
                    CartId = 3,
                    ProductId = 1,
                    Quantity = 2
                },
                new Cart_Product
                {
                    CartId = 3,
                    ProductId = 2,
                    Quantity = 1
                }
            };

            foreach (var cartProduct in cartProducts)
            {
                dataAccess.CreateCartProduct(cartProduct);
            }
        }

        private static void SeedBilling()
        {
            BillingData dataAccess = new BillingData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var billings = new List<Billing>
            {
                new Billing
                {
                    FirstName = "CY",
                    LastName = "Hoo",
                    Email = "cyhoo0528@gmail.com",
                    Address = "PV15 Setapak",
                    Phone = "0192009289"
                }
            };
            foreach (var bill in billings)
            {
                dataAccess.CreateBilling(bill);
            }
        }
    }
}