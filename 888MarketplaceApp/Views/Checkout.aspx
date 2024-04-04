<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="_888MarketplaceApp.Views.Checkout" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
        <section class="breadcrumb-section set-bg" data-setbg="../Images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./LandingPage.aspx">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <!--<div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div> -->
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>First Name<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Firstname" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Lastname" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Country<span>*</span></p>
                                        <asp:DropDownList ID="ddlCountries" runat="server"></asp:DropDownList> <br/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>State<span>*</span></p>
                                        <asp:DropDownList ID="ddlState" runat="server"></asp:DropDownList> <br/>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <asp:TextBox runat="server" ID="Address" placeholder="Street Address" CssClass="form-control checkout__input__add" />
                                <asp:TextBox runat="server" ID="Address2" placeholder="Apartment, suite, unite ect (optinal)" CssClass="form-control" />
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <asp:TextBox runat="server" ID="Town" CssClass="form-control" />
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <asp:TextBox runat="server" ID="Postcode" CssClass="form-control" />
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Phone" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h4>Shipping Methods</h4>
                                <div class="checkout__input__checkbox">
                                    <asp:CheckBox runat="server" ID="Delstd" Checked="true" />
                                    <asp:Label runat="server" AssociatedControlID="Delstd">Standard (1 - 2 weeks)</asp:Label>
                                   
                                </div>
                                <div class="checkout__input__checkbox">
                                    <asp:CheckBox runat="server" ID="Delexp" Checked="false" />
                                    <asp:Label runat="server" AssociatedControlID="Delexp">Express (1 - 4 days)</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <li>Vegetable’s Package <span>$75.99</span></li>
                                    <li>Fresh Vegetable <span>$151.99</span></li>
                                    <li>Organic Bananas <span>$53.99</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span>$750.99</span></div>
                                <div class="checkout__order__total">Total <span>$750.99</span></div>
                                <!--<div class="checkout__order__total">Promo Code <asp:TextBox runat="server" ID="Promo" placeholder="Promo25" CssClass="form-control" /></div>-->
                                <div class="checkout__order__total">Payment Methods <br />
                                    <div class="checkout__input__checkbox">
                                        <asp:CheckBox runat="server" ID="CC" Checked="true" />
                                        <asp:Label runat="server" AssociatedControlID="CC" >Credit Card/Debit Card</asp:Label>
                                    </div>
                                    <div class="checkout__input__checkbox">
                                        <asp:CheckBox runat="server" ID="Paypal" Checked="false" />
                                        <asp:Label runat="server" AssociatedControlID="Paypal">PayPal</asp:Label>
                                    </div>
                                </div>
                                <asp:HyperLink ID="PlaceOrd" type="submit" class="site-btn" NavigateUrl="~/Views/Payment.aspx" runat="server">PLACE ORDER</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</asp:Content>
