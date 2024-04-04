<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="_888MarketplaceApp.Views.Payment" %>

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
                                                                    <asp:TextBox runat="server" autofocus="autofocus" ID="CardholderName" CssClass="form-control" />
                                                                <span class="field-validation-valid" data-valmsg-for="CardholderName" data-valmsg-replace="true"></span>
                                                            </div>
                                                        </div>

                                                        <div class="row align-items-center mb-3">
                                                            <div class="col-md-4 col-12 text-md-right">
                                                                <label class="col-form-label" for="CardNumber">Card number:</label>
                                                            </div>
                                                            <div class="col-md-4 col-12 text-right">
                                                                <asp:TextBox runat="server" ID="CardNumber" CssClass="form-control" />
                                                                <span class="field-validation-valid" data-valmsg-for="CardNumber" data-valmsg-replace="true"></span>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="checkout__input">
                                                                    <p>Expiration date:<span>*</span></p>
                                                                    <asp:DropDownList ID="ddlExpMonth" runat="server"></asp:DropDownList> <br/>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="checkout__input">
                                                                    <p>Expiration Year:<span>*</span></p>
                                                                    <asp:DropDownList ID="ddlExpYear" runat="server"></asp:DropDownList> <br/><br/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row align-items-center mb-3">
                                                            <div class="col-md-4 col-12 text-md-right">
                                                                <label class="col-form-label" for="CardCode">Card code:</label>
                                                            </div>
                                                            <div class="col-md-4 col-12 text-right">
                                                                <asp:TextBox runat="server" ID="CardCode" CssClass="form-control" />
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
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"  aria-label="Close"></button>
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
