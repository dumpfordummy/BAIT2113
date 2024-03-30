﻿<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AllProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.AllProduct" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar__main">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit &amp; Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter &amp; Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya &amp; Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;"></span>
                                    <div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;"></div>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount" value="$10">
                                        <input type="text" id="maxamount" value="$540">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Colors</h4>
                            <div class="sidebar__item__color sidebar__item__color--white">
                                <label for="white">
                                    White
                                    <input type="radio" id="white">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--gray">
                                <label for="gray">
                                    Gray
                                    <input type="radio" id="gray">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--red">
                                <label for="red">
                                    Red
                                    <input type="radio" id="red">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--black">
                                <label for="black">
                                    Black
                                    <input type="radio" id="black">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--blue">
                                <label for="blue">
                                    Blue
                                    <input type="radio" id="blue">
                                </label>
                            </div>
                            <div class="sidebar__item__color sidebar__item__color--green">
                                <label for="green">
                                    Green
                                    <input type="radio" id="green">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>Popular Size</h4>
                            <div class="sidebar__item__size">
                                <label for="large">
                                    Large
                                    <input type="radio" id="large">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="medium">
                                    Medium
                                    <input type="radio" id="medium">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="small">
                                    Small
                                    <input type="radio" id="small">
                                </label>
                            </div>
                            <div class="sidebar__item__size">
                                <label for="tiny">
                                    Tiny
                                    <input type="radio" id="tiny">
                                </label>
                            </div>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel owl-loaded owl-drag">


                                    <div class="owl-stage-outer">
                                        <div class="owl-stage" style="transform: translate3d(-787px, 0px, 0px); transition: 1.2s; width: 1575px;">
                                            <div class="owl-item cloned" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="owl-item cloned" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="owl-item" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="owl-item active" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="owl-item cloned" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="owl-item cloned" style="width: 262.5px;">
                                                <div class="latest-prdouct__slider__item">
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-1.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-2.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                    <a href="#" class="latest-product__item">
                                                        <div class="latest-product__item__pic">
                                                            <img src="Ogani%20Template_files/lp-3.jpg" alt="">
                                                        </div>
                                                        <div class="latest-product__item__text">
                                                            <h6>Crab Pool Security</h6>
                                                            <span>$30.00</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="owl-nav">
                                        <button type="button" role="presentation" class="owl-prev"><span class="fa fa-angle-left"><span></span></span></button>
                                        <button type="button" role="presentation" class="owl-next"><span class="fa fa-angle-right"><span></span></span></button>
                                    </div>
                                    <div class="owl-dots disabled"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select style="display: none;">
                                        <option value="0" selected="selected">Default</option>
                                        <option value="0">Default</option>
                                    </select><div class="nice-select" tabindex="0"><span class="current">Default</span><ul class="list">
                                        <li data-value="0" class="option selected">Default</li>
                                        <li data-value="0" class="option">Default</li>
                                    </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg" style="background-image: url(&quot;img/product/product-1.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg" style="background-image: url(&quot;img/product/product-2.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg" style="background-image: url(&quot;img/product/product-3.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-4.jpg" style="background-image: url(&quot;img/product/product-4.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-5.jpg" style="background-image: url(&quot;img/product/product-5.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-6.jpg" style="background-image: url(&quot;img/product/product-6.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg" style="background-image: url(&quot;img/product/product-7.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-8.jpg" style="background-image: url(&quot;img/product/product-8.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-9.jpg" style="background-image: url(&quot;img/product/product-9.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-10.jpg" style="background-image: url(&quot;img/product/product-10.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-11.jpg" style="background-image: url(&quot;img/product/product-11.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-12.jpg" style="background-image: url(&quot;img/product/product-12.jpg&quot;);">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
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
