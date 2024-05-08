<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.AllProduct" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .product__item__pic__hover li:last-child {
            margin-right: 0;
        }

        .product__item__pic__hover li:hover a {
            background: #38d39f;
            border-color: #38d39f;
        }

        .product__item__pic__hover li:nth-child(2):hover a {
            background: #0d6efd;
            border-color: #0d6efd;
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
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount" value="$10">
                                        <input type="text" id="maxamount" value="$540">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select style="display: none;">
                                        <option value="0" selected="selected">Default</option>
                                        <option value="0">Default</option>
                                    </select><div class="nice-select" tabindex="0">
                                        <span class="current">Default</span><ul class="list">
                                            <li data-value="0" class="option selected">Default</li>
                                            <li data-value="0" class="option">Default</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater runat="server" ID="ProductsRepeater">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item" onclick="window.location.href = '/Product?Id=<%# Eval("Id") %>'">
                                        <div class="product__item__pic set-bg" data-setbg="<%# Eval("ImagePaths").ToString().Split(';')[0] %>" style='background-image:url("<%# Eval("ImagePaths").ToString().Split(';')[0] %>")'>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pencil-square-o"></i></a></li>
                                                <li><a href="#"><i class="fa fa-trash"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#"><%# Eval("Name") %></a></h6>
                                            <h5><%# Eval("Price") %></h5>
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
</asp:Content>
