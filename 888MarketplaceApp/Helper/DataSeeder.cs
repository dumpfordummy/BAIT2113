using _888MarketplaceApp.DataAccess;
using _888MarketplaceApp.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace _888MarketplaceApp.Helper
{
    public class DataSeeder
    {

        public void Seed()
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
            } catch (Exception ex)
            {
                Debug.WriteLine(ex.ToString());
                //throw ex;
            }
            
        }

        private void SeedUserroles()
        {
            var userRoles = new List<Userrole>
            {
                new Userrole { Role = "Admin" },
                new Userrole { Role = "Customer" }
            };

            UserroleData dataAccess = new UserroleData();
            foreach (var userrole in userRoles)
            {
                dataAccess.CreateUserrole(userrole);
            }
        }

        private void SeedUsers()
        {
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

            UserData dataAccess = new UserData();
            foreach (var user in users)
            {
                dataAccess.CreateUser(user);
            }
        }

        private void SeedShippingMethods()
        {
            var shippingMethods = new List<ShippingMethod>
            {
                new ShippingMethod { Name = "Standard", Description = "Standard shipping" },
                new ShippingMethod { Name = "Express", Description = "Express shipping" }
            };

            ShippingMethodData dataAccess = new ShippingMethodData();
            foreach (var shippingMethod in shippingMethods)
            {
                dataAccess.CreateShippingMethod(shippingMethod);
            }
        }

        private void SeedCategories()
        {
            var categories = new List<Category>
            {
                new Category { Name = "Electronics", Description = "Electronics products" },
                new Category { Name = "Clothing", Description = "Clothing products" }
            };

            CategoryData dataAccess = new CategoryData();
            foreach (var category in categories)
            {
                dataAccess.CreateCategory(category);
            }
        }

        private void SeedProducts()
        {
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

            ProductData dataAccess = new ProductData();
            foreach (var product in products)
            {
                dataAccess.CreateProduct(product);
            }
        }

        private void SeedOrders()
        {
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

            OrderData dataAccess = new OrderData();
            foreach (var order in orders)
            {
                dataAccess.CreateOrder(order);  
            }
        }

        private void SeedPaymentMethods()
        {
            var paymentMethods = new List<PaymentMethod>
            {
                new PaymentMethod { Name = "Credit Card", Description = "Payment via credit card" },
                new PaymentMethod { Name = "PayPal", Description = "Payment via PayPal" }
            };

            PaymentMethodData dataAccess = new PaymentMethodData();
            foreach (var paymentMethod in paymentMethods)
            {
                dataAccess.CreatePaymentMethod(paymentMethod);  
            }
        }

        private void SeedVouchers()
        {
            var vouchers = new List<Voucher>
            {
                new Voucher { Code = "VOUCHERRM10", Amount = 10.00 },
                new Voucher { Code = "VOUCHERRM20", Amount = 20.00 }
            };

            VoucherData dataAccess = new VoucherData();
            foreach(var voucher in vouchers)
            {
                dataAccess.CreateVoucher(voucher);
            }
        }

        private void SeedWishlists()
        {
            var wishlists = new List<Wishlist>
            {
                new Wishlist { BuyerId = 2 }
            };

            WishlistData dataAccess = new WishlistData();
            foreach(var wish in wishlists)
            {
                dataAccess.CreateWishlist(wish);
            }

        }

        private void SeedReviews()
        {
            var reviews = new List<Review>
            {
                new Review { Rating = 5, Content = "Great product! Very satisfied" },
                new Review { Rating = 4, Content = "Nice product but a bit unsatisfied!" }
            };

            ReviewData dataAccess = new ReviewData();
            foreach (var review in reviews)
            {
                dataAccess.CreateReview(review);    
            }
        }

        private void SeedCarts()
        {
            var carts = new List<Cart>
            {
                new Cart { BuyerId = 2 }
            };
            CartData dataAccess = new CartData();
            foreach ( var cart in carts)
            {
                dataAccess.CreateCart(cart);
            }
        }

        private void SeedDeliveries()
        {
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

            DeliveryData dataAccess = new DeliveryData();
            foreach (var delivery in deliveries)
            {
                dataAccess.CreateDelivery(delivery);
            }
        }

        private void SeedPayment()
        {
            var payments = new List<Payment>
            {
                new Payment
                {
                    PaymentAmount = 99.99,
                    PaymentDate = DateTime.Now,
                    PaymentMethodId = 1,
                    
                }
            };

            PaymentData dataAccess = new PaymentData();
            foreach (var payment in payments)
            {
                dataAccess.CreatePayment(payment);
            }
        }

        private void SeedProductOrders()
        {
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

            ProductOrderData dataAccess = new ProductOrderData();
            foreach (var productOrder in productOrders)
            {
                dataAccess.CreateProductOrder(productOrder);
            }
        }

        private void SeedCartProducts()
        {
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

            CartProductData dataAccess = new CartProductData();
            foreach (var cartProduct in cartProducts)
            {
                dataAccess.CreateCartProduct(cartProduct);
            }
        }

        private void SeedWishlistProducts()
        {
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

            WishlistProductData dataAccess = new WishlistProductData();
            foreach (var wish in wishlistProduct)
            {
                dataAccess.CreateWishlistProduct(wish);
            }
        }
    }
}