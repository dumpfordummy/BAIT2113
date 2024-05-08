<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="_888MarketplaceApp.Views.Wishlist" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Shoes</a></li>
                            <li><a href="#">Clothing & Apparel</a></li>
                            <li><a href="#">Electronic Devices</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Hats</a></li>
                            <li><a href="#">Watches</a></li>
                            <li><a href="#">Snacks</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../Images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Wishlist</h2>
                        <div class="breadcrumb__option">
                            <a class="color-blue" href="/Views/LandingPage.aspx">Home</a>
                            <span>Wishlist</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="WishlistRepeater" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="shoping__cart__item">
                                                <img src="img/cart/cart-2.jpg" alt="">
                                                <h5><%# Eval("Product.Name") %></h5>
                                            </td>
                                            <td class="shoping__cart__price">
                                                <%# Eval("Product.Price") %>
                                            </td>
                                            <td class="shoping__cart__quantity">
                                                <div class="quantity">
                                                    <div class="pro-qty">
                                                        <asp:TextBox runat="server" type="text" value='<%# Eval("WishlistQuantity") %>' ID="qty" />
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="shoping__cart__total">
                                                <%# Eval("WishlistAmount") %>
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <span class="icon_close"></span>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>

