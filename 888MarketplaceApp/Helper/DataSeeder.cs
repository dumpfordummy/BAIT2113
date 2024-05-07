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
            try
            {
                SeedVouchers();
                SeedUserroles();
                SeedCategories();
                SeedPaymentMethods();
                SeedShippingMethods();
                SeedReviews();
                SeedUsers();
                SeedWishlists();
                SeedCarts();
                SeedProducts();
                SeedWishlistProducts();
                SeedCartProducts();
                SeedPayment();
                SeedDeliveries();
                SeedOrders();
                SeedProductOrders();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        Debug.WriteLine("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                        throw ex;
                    }
                }
            }
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
                    Email = "cyhoo0528@example.com",
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
                new ShippingMethod { Name = "Standard", Description = "Standard shipping" },
                new ShippingMethod { Name = "Express", Description = "Express shipping" }
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
                    CategoryId = 1
                },
                new Product
                {
                    DateCreated = DateTime.Now,
                    Name = "Polo T-shirt",
                    Description = "Casual T-shirt",
                    Price = 19.99,
                    Quantity = 50,
                    SellerId = 2,
                    CategoryId = 2
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
                    Amount = 199.99,
                    Note = "Sample order",
                    Status = Order.Completed,
                    BuyerId = 3,
                    PaymentId = 1,
                    DeliveryId = 1,
                    VoucherId = null
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
                new PaymentMethod { Name = "Credit Card", Description = "Payment via credit card" },
                new PaymentMethod { Name = "PayPal", Description = "Payment via PayPal" }
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

        private static void SeedWishlists()
        {
            WishlistData dataAccess = new WishlistData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var wishlists = new List<Wishlist>
            {
                new Wishlist { BuyerId = 2 }
            };

            foreach (var wish in wishlists)
            {
                dataAccess.CreateWishlist(wish);
            }

        }

        private static void SeedReviews()
        {
            ReviewData dataAccess = new ReviewData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var reviews = new List<Review>
            {
                new Review { Rating = 5, Content = "Great product! Very satisfied" },
                new Review { Rating = 4, Content = "Nice product but a bit unsatisfied!" }
            };

            foreach (var review in reviews)
            {
                dataAccess.CreateReview(review);
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
                new Cart { BuyerId = 2 }
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
                    EstimatedDeliveryDate = DateTime.Now.AddDays(5)
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
                    PaymentMethodId = 1,

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
                    Quantity = 2,
                    ReviewId = 1,
                },
                new Product_Order
                {
                    OrderId = 1,
                    ProductId = 2,
                    Quantity = 1,
                    ReviewId = 2,
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
                    CartId = 1,
                    ProductId = 1,
                    Quantity = 1
                },
                new Cart_Product
                {
                    CartId = 1,
                    ProductId = 2,
                    Quantity = 1
                }
            };

            foreach (var cartProduct in cartProducts)
            {
                dataAccess.CreateCartProduct(cartProduct);
            }
        }

        private static void SeedWishlistProducts()
        {
            WishlistProductData dataAccess = new WishlistProductData();
            if (dataAccess.hasExistingData)
            {
                return;
            }

            var wishlistProduct = new List<Wishlist_Product>
            {
                new Wishlist_Product
                {
                    WishlistId = 1,
                    ProductId = 1,
                    Quantity = 1
                },
                new Wishlist_Product
                {
                    WishlistId = 1,
                    ProductId = 2,
                    Quantity = 1
                }
            };

            foreach (var wish in wishlistProduct)
            {
                dataAccess.CreateWishlistProduct(wish);
            }
        }
    }
}