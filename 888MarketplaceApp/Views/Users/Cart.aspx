<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="_888MarketplaceApp.Views.Cart" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="../Images/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="/Views/LandingPage.aspx">Home</a>
                            <span>Shopping Cart</span>
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
                                <asp:Repeater ID="CartRepeater" runat="server">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="ProductId" Value='<%# Eval("Product.Id") %>' />
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
                                                        <asp:Button runat="server" ID="btnPlus" Text="-" OnClick="DecreaseQuantity_Click" CommandArgument='<%# Eval("Product.Id") + "," + Eval("CartQuantity") %>' />
                                                        <asp:TextBox runat="server" ID="ItemQuantity" type="SingleLine" Text='<%# Eval("CartQuantity") %>' Enabled="false"></asp:TextBox>
                                                        <asp:Button runat="server" ID="btnMinus" Text="+" OnClick="IncreaseQuantity_Click" CommandArgument='<%# Eval("Product.Id") + "," + Eval("CartQuantity") %>' />
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="shoping__cart__total">
                                                <asp:Label ID="CartItemTotal" Text='<%# Eval("CartAmount") %>' runat="server" ></asp:Label>
                                            </td>
                                            <td class="shoping__cart__item__close">
                                                <asp:Button runat="server" OnClick="DeleteCartItem" Text="Delete" CommandArgument='<%# Eval("Product.Id") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
                <asp:Label ID="Result" CssClass="text-danger" runat="server" />
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <asp:HyperLink runat="server" NavigateUrl="/Views/LandingPage.aspx" Text="CONTINUE SHOPPING" CssClass="primary-btn cart-btn" />
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <asp:TextBox runat="server" ID="Coupon" placeholder="Enter your coupon code" CssClass="form-control" />
                            <br />
                            <asp:Button runat="server" Text="APPLY COUPON" OnClick="ApplyCoupon_Click" CssClass="site-btn" ForeColor="White" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <asp:Label runat="server" ID="SubTotal"></asp:Label></li>
                            <li>Delivery Fee<asp:Label runat="server" ID="DeliveryFee"></asp:Label></li>
                            <li><asp:Label runat="server" ID="VoucherDiscount" Visible="false"></asp:Label></li>
                            <li>Total <asp:Label runat="server" ID="Total"></asp:Label></li>
                        </ul>
                        <asp:HyperLink ID="lnkChkOut" class="primary-btn" NavigateUrl="~/Views/Users/Checkout.aspx" runat="server">PROCEED TO CHECKOUT</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>

