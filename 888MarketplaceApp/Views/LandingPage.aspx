<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="_888MarketplaceApp.Views.LandingPage" MasterPageFile="~/Views/Site.Master" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        body {
            font-family: "Cairo", sans-serif !important;
            font-size:1rem;
            font-weight:400;
            line-height:1.5;
            color:#212529;
            text-align:left;
        }

        ul {
            margin-bottom: 0;
        }

        .footer{
            font-family: "Cairo", sans-serif !important;
        }

        a { text-decoration: none !important; }
    </style>
    <!-- Hero Section Begin -->
    <section class="hero">
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
                                <input type="text" placeholder="What are you looking for?" />
                                <button id="btnSearch" class="site-btn" type="submit" runat="server">SEARCH</button>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+6012 3456789</h5>
                                <span>Support 09:00 - 22:00 (MY)</span>
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="../Images/orange_shoe_1.jpg" style="background-size: 100% 100%;">
                        <div class="hero__text">
                            <span>LATEST DESIGN</span>
                            <h2>AMIBAS NUKE 3 <br />STRE4MLIN3</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-1.jpg">
                            <h5><a href="#">Shoes</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                            <h5><a href="#">Shirts</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                            <h5><a href="#">Pants</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <li data-filter=".tshirt">T-Shirts</li>
                            <li data-filter=".shoes">Shoes</li>
                            <li data-filter=".pants">Pants</li>
                            <li data-filter=".hats">Hats</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix tshirt">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg" >
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                <li><a href="#"><i class="fa fa-trash"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Product Name</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix hats">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                <li><a href="#"><i class="fa fa-trash"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Product Name</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix shoes">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                <li><a href="#"><i class="fa fa-trash"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Product Name</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix shoes">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                <li><a href="#"><i class="fa fa-trash"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">Product Name</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <!-- Copy Paste -->
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Latest Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>Top Rated Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                        <h4>On Sale Products</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                            <div class="latest-prdouct__slider__item">
                                <a href="#" class="latest-product__item">
                                    <div class="latest-product__item__pic">
                                        <img src="img/latest-product/lp-1.jpg" alt="">
                                    </div>
                                    <div class="latest-product__item__text">
                                        <h6>Product Name</h6>
                                        <span>$30.00</span>
                                    </div>
                                </a>
                                <!-- Copy Paste -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Product Section End -->
</asp:Content>
