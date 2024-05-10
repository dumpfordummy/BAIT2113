﻿<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.AllProduct" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .product__item__pic__hover li:last-child {
            margin-right: 0;
        }

        .product__item__pic__hover li:first-child:hover a {
            background: #38d39f !important;
            border-color: #38d39f !important;
        }

        .product__item__pic__hover li:nth-child(2):hover a {
            background: #0d6efd !important;
            border-color: #0d6efd !important;
        }

        .product__item__pic__hover li:last-child:hover a {
            background: #dc3545;
            border-color: #dc3545;
        }
    </style>
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar__main">
                        <div class="sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <asp:Repeater ID="CategoryRepeater" runat="server">
                                    <ItemTemplate>
                                        <li><a href="#"><%# Eval("Name") %></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-6 col-md-6"></div>
                            <div class="col-lg-6 col-md-6">
                                <div class="filter__found">
                                    <h6><asp:Label runat="server" ID="totalProductCount" ></asp:Label> Products found</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater runat="server" ID="ProductsRepeater">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item" onclick="window.location.href = '/Product?Id=<%# Eval("Product.Id") %>'">
                                        <div class="product__item__pic set-bg" data-setbg="<%# Eval("Product.ImagePaths").ToString().Split(';')[0] %>" style='background-image:url("<%# Eval("Product.ImagePaths").ToString().Split(';')[0] %>")'>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                <li runat="server" visible='<%# Eval("ShouldDisplay") %>'><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                                <li runat="server" visible='<%# Eval("ShouldDisplay") %>'><a href="#"><i class="fa fa-trash"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#"><%# Eval("Product.Name") %></a></h6>
                                            <h5>RM <%# Eval("Product.Price") %></h5>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        var target = document.getElementsByClassName("product__item__pic__hover")[0];

    </script>
</asp:Content>
