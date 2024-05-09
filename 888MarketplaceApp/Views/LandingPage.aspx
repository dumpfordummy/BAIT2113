<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="_888MarketplaceApp.Views.LandingPage" MasterPageFile="~/Views/Site.Master" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        body {
            font-family: "Cairo", sans-serif !important;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
        }

        ul {
            margin-bottom: 0;
        }

        .footer {
            font-family: "Cairo", sans-serif !important;
        }

        a {
            text-decoration: none !important;
        }
    </style>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <input runat="server" id="txtSearch" type="text" placeholder="What are you looking for?" />
                            <button id="btnSearch" class="site-btn" runat="server" onserverclick="searchProducts">SEARCH</button>
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
                    <div class="hero__item set-bg" data-setbg="../Images/orange_shoe_banner.jpg" style="background-size: 100% 100%;">
                        <div class="hero__text">
                            <span style="color: #ff7400;">LATEST DESIGN</span>
                            <h2>AMIBAS NUKE 5
                                <br />
                                STRE4MLIN3</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <asp:HyperLink runat="server" CssClass="primary-btn" Text="SHOP NOW" NavigateUrl="~/Views/AllProduct.aspx"></asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Products</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <asp:Repeater runat="server" ID="featCtrlRepeater">
                                <ItemTemplate>
                                    <li data-filter=".Cat<%# Eval("Id") %>"><%# Eval("Name") %></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <asp:Repeater runat="server" ID="featProdRepeater">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 mix Cat<%# Eval("Product.CategoryId") %>">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="<%# Eval("Product.ImagePaths").ToString().Split(';')[0] %>">
                                    <ul class="featured__item__pic__hover">
                                        <li runat="server" visible='<%# Eval("ShouldDisplayATC") %>'><asp:LinkButton runat="server" ID="addtoCartBtn" OnClick="AddProductToCart" Text='<i class="fa fa-shopping-cart"></i>' CommandArgument='<%# Eval("Product.Id") %>' /></li>
                                        <li runat="server" visible='<%# Eval("ShouldDisplay") %>'><a href="/Views/Users/EditProduct?Id=<%# Eval("Product.Id") %>"><i class="fa fa-pencil-square-o"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="#"><%# Eval("Product.Name") %></a></h6>
                                    <h5>RM <%# Eval("Product.Price") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    </asp:Content>
