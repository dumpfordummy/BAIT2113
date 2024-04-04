<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="_888MarketplaceApp.Views.Cart" %>

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
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
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
                            <a href="landingPage.aspx">Home</a>
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

                    <div class="card-body"><form action="" id="co-payment-info-form"><div id="checkout-payment-info-load"><div class="checkout-data"><div class="col-12 px-0"><!----> <div class="section payment-info"><div class="info"><div class="container">
    <div class="row align-items-center mb-3">
        <div class="col-md-4 col-12 text-md-right">
            <label class="col-form-label" for="CardholderName">Cardholder name:</label>
        </div>
        <div class="col-md-4 col-12 text-right">
            <input class="form-control" autofocus="autofocus" type="text" data-val="true" data-val-required="Enter cardholder name" id="CardholderName" name="CardholderName" value="">
            <span class="field-validation-valid" data-valmsg-for="CardholderName" data-valmsg-replace="true"></span>
        </div>
    </div>

    <div class="row align-items-center mb-3">
        <div class="col-md-4 col-12 text-md-right">
            <label class="col-form-label" for="CardNumber">Card number:</label>
        </div>
        <div class="col-md-4 col-12 text-right">
            <input class="form-control" autofocus="autofocus" type="text" data-val="true" data-val-creditcard="Wrong card number" id="CardNumber" name="CardNumber" value="">
            <span class="field-validation-valid" data-valmsg-for="CardNumber" data-valmsg-replace="true"></span>
        </div>
    </div>

    <div class="row align-items-center mb-3">
        <div class="col-md-4 col-12 text-md-right">
            <label class="col-form-label" for="ExpireMonth">Expiration date:</label>
        </div>
        <div class="col-md-4 col-12 text-right d-md-flex input-group">
            <select class="form-control col-md-6 col-12" data-val="true" data-val-required="Expire month is required" id="ExpireMonth" name="ExpireMonth"><option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
            <select class="form-control col-md-6 col-12" data-val="true" data-val-required="Expire year is required" id="ExpireYear" name="ExpireYear"><option value="2024">2024</option>
<option value="2025">2025</option>
<option value="2026">2026</option>
<option value="2027">2027</option>
<option value="2028">2028</option>
<option value="2029">2029</option>
<option value="2030">2030</option>
<option value="2031">2031</option>
<option value="2032">2032</option>
<option value="2033">2033</option>
<option value="2034">2034</option>
<option value="2035">2035</option>
<option value="2036">2036</option>
<option value="2037">2037</option>
<option value="2038">2038</option>
</select>
        </div>
    </div>

    <div class="row align-items-center mb-3">
        <div class="col-md-4 col-12 text-md-right">
            <label class="col-form-label" for="CardCode">Card code:</label>
        </div>
        <div class="col-md-4 col-12 text-right">
            <input class="form-control" autofocus="autofocus" type="text" data-val="true" data-val-regex="Wrong card code" data-val-regex-pattern="^[0-9]{3,4}$" id="CardCode" name="CardCode" value="">
            <span class="field-validation-valid" data-valmsg-for="CardCode" data-valmsg-replace="true"></span>
        </div>
    </div>
</div>
</div></div></div></div></div></form> <div id="payment-info-buttons-container" class="col-12 buttons py-1 mt-3 px-0"><a href="#" id="back-payment_info" class="btn btn-secondary">Back</a> <input type="button" value="Continue" class="btn btn-info payment-info-next-step-button"> <span id="payment-info-please-wait" class="please-wait" style="display: none;">Loading next step...</span></div></div>


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
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-1.jpg" alt="">
                                        <h5>Vegetable’s Package</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $55.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $110.00
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-2.jpg" alt="">
                                        <h5>Fresh Garden Vegetable</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $39.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $39.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="img/cart/cart-3.jpg" alt="">
                                        <h5>Organic Bananas</h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $69.00
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        $69.99
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>

