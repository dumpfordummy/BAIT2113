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
                                        <asp:RequiredFieldValidator runat="server" ID="FirstNameValidator" ControlToValidate="FirstName" CssClass="text-danger" ErrorMessage="The First Name field is required." />

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Lastname" CssClass="form-control" />
                                        <asp:RequiredFieldValidator runat="server" ID="LastNameValidator" ControlToValidate="LastName" CssClass="text-danger" ErrorMessage="The Last Name field is required." />

                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <asp:TextBox runat="server" ID="Address" placeholder="Street Address" CssClass="form-control checkout__input__add" />
                                <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ControlToValidate="Address" CssClass="text-danger" ErrorMessage="The Address field is required." />

                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone" />
                                        <asp:CustomValidator ID="phoneValidator" runat="server" ControlToValidate="Phone" CssClass="text-danger" ErrorMessage="" OnServerValidate="PhoneValidator" ValidateEmptyText="true"></asp:CustomValidator>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                        <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The Email field is required." />

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h4>Shipping Methods</h4>
                                <div class="checkout__input__checkbox">
                                    <div class="form-group">
                                        <asp:RadioButton runat="server" ID="radioDeliStd" GroupName="deliMethod" />
                                        <asp:Label runat="server" AssociatedControlID="radioDeliStd">DHL</asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <asp:RadioButton runat="server" ID="radioDeliExp" GroupName="deliMethod" />
                                        <asp:Label runat="server" AssociatedControlID="radioDeliExp">FedEx</asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <asp:Repeater ID="ProductCheckoutRepeater" runat="server">
                                        <ItemTemplate>
                                            <li><%# Eval("Product.Name") %> x<%# Eval("ProductQuantity") %>
                                                <asp:Label runat="server" ID="ItemAmount" Text='<%# Eval("Amount") %>'></asp:Label></li>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>
                                <div class="checkout__order__subtotal">
                                    Subtotal
                                    <asp:Label runat="server" ID="SubTotal"></asp:Label>
                                </div>
                                <div class="checkout__order__subtotal">
                                    Delivery
                                    <asp:Label runat="server" ID="DeliveryFee"></asp:Label>
                                </div>
                                <div class="checkout__order__subtotal">
                                    <asp:Label runat="server" ID="VoucherDiscount"></asp:Label>
                                </div>
                                <div class="checkout__order__total">
                                    Total
                                    <asp:Label runat="server" ID="Total"></asp:Label>
                                </div>
                                <div class="checkout__order__total">
                                    Payment Methods
                                    <br />
                                    <div class="checkout__input__checkbox">
                                        <div class="form-group">
                                            <asp:RadioButton runat="server" ID="radioCard" GroupName="paymentMethod" />
                                            <asp:Label runat="server" AssociatedControlID="radioCard">Credit Card/Debit Card</asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButton runat="server" ID="radioPaypal" GroupName="paymentMethod" />
                                            <asp:Label runat="server" AssociatedControlID="radioPaypal">PayPal</asp:Label>
                                        </div>

                                    </div>
                                </div>
                                <asp:Label runat="server" ID="Result" CssClass="text-danger"></asp:Label>
                                <asp:Button ID="PlaceOrderBtn" type="submit" class="site-btn" OnClick="PlaceOrder" Text="PLACE ORDER" runat="server" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</asp:Content>
