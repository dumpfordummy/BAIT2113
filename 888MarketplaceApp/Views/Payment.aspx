<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="_888MarketplaceApp.Views.Cart" %>

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
            <div class="checkout__form">
                <h4>Billing Details</h4>

                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="card-body"><form action="" id="co-payment-info-form">
                                <div id="checkout-payment-info-load">
                                    <div class="checkout-data">
                                        <div class="col-12 px-0">
                                            <div class="section payment-info">
                                                <div class="info">
                                                    <div class="container">
                                                        <div class="row align-items-center mb-3">
                                                            <div class="col-md-4 col-12 text-md-right">
                                                                <label class="col-form-label" for="CardholderName">Cardholder name:</label>
                                                            </div>
                                                            <div class="col-md-4 col-12 text-right">
                                                                    <asp:TextBox runat="server" ID="CardholderName" CssClass="form-control" />
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
                                                                <select class="form-control col-md-6 col-12" data-val="true" data-val-required="Expire month is required" id="ExpireMonth" name="ExpireMonth">
                                                                    <option value="1">01</option>
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
                                                                <select class="form-control col-md-6 col-12" data-val="true" data-val-required="Expire year is required" id="ExpireYear" name="ExpireYear">
                                                                    <option value="2024">2024</option>
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
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                            <div id="payment-info-buttons-container" class="col-12 buttons py-1 mt-3 px-0">
                                <asp:HyperLink ID="Back" class="site-btn" NavigateUrl="~/Views/Checkout.aspx" runat="server">Back</asp:HyperLink> 
                                <asp:HyperLink ID="Continue" data-bs-toggle="modal" data-bs-target="#paymentSuccessModal" class="site-btn" NavigateUrl="~/Views/PaymentSuccess.aspx" runat="server">Continue</asp:HyperLink>

                                <div class="modal fade" id="paymentSuccessModal" tabindex="-1" aria-labelledby="paymentSuccessModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="paymentSuccessModalLabel">Payment Successful</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        Congratulations! Your payment was successful.
                                      </div>
                                      <div class="modal-footer">
                                        <asp:HyperLink ID="HyperLink1" class="site-btn" NavigateUrl="~/Views/LandingPage.aspx" runat="server">Close</asp:HyperLink>
                                      </div>
                                    </div>
                                  </div>
                                </div>

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
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</asp:Content>
