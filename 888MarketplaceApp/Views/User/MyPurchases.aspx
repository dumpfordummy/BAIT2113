<%@ Page Language="C#" EnableEventValidation="true" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="MyPurchases.aspx.cs" Inherits="_888MarketplaceApp.Views.MyPurchases" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper">
            <div class="acc-main-panel max-width">
                <div class="acc-content-wrapper center-form">

                    <div class="nav-panel">
                        <nav class="acc-sidebar acc-sidebar-offcanvas" id="sidebar">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                                        <i class="ti-user menu-icon"></i>
                                        <span class="menu-title">My Account</span>
                                        <i class="menu-arrow"></i>
                                    </a>
                                    <div class="collapse" id="auth">
                                        <ul class="nav flex-column sub-menu">
                                            <li class="nav-item"><a class="nav-link" href="/Views/User/Account">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/Views/User/ChangePassword">Change Password</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link acc-nav-item-active acc-nav-link-active" href="/Views/User/Mypurchases">
                                        <i class="ti-view-list-alt menu-icon acc-nav-link-active"></i>
                                        <span class="menu-title">My Purchase</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <div class="row accountForm">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-title-border">
                                        <p class="card-title-strong">My Purchases</p>
                                        <div class="card-title-description">Manage your purchases</div>
                                    </div>

                                    <asp:Repeater ID="OrderRepeater" runat="server" OnItemDataBound="OrderRepeater_ItemDataBound">
                                        <ItemTemplate>

                                            <div class="card-content">
                                                <div class="order-information">
                                                    <div class="StatusName">
                                                        <asp:Literal runat="server" Text='<%# Eval("Status")  %>'></asp:Literal>

                                                    </div>
                                                    <div class="StatusDescription">
                                                        <asp:Literal runat="server" Text='<%# Eval("Note")  %>'></asp:Literal>
                                                    </div>
                                                </div>

                                                <asp:Repeater ID="OrderProductRepeater" runat="server">
                                                    <ItemTemplate>
                                                        <div class="order-item">
                                                            <div class="itemImg">
                                                                <asp:Image CssClass="purchaseItem" runat="server" ImageUrl='<%# Eval("OrderProductImage")  %>' AlternateText="Example Image" />
                                                            </div>
                                                            <div class="itemContent">
                                                                <div class="itemDetails">
                                                                    <div class="itemTitle">
                                                                        <asp:Literal runat="server" Text='<%# Eval("Product.Name")  %>'></asp:Literal>
                                                                    </div>
                                                                    <div class="itemDescription">
                                                                        <asp:Literal runat="server" Text='<%# Eval("Product.Description")  %>'></asp:Literal>
                                                                    </div>
                                                                    <div class="itemCategory">
                                                                        <asp:Literal runat="server" Text='<%# Eval("Product.Category.Name")  %>'></asp:Literal>
                                                                    </div>
                                                                    <div class="itemQuantity">
                                                                        <asp:Literal runat="server" Text='<%# Eval("OrderProductQuantity")  %>'></asp:Literal>
                                                                    </div>
                                                                </div>
                                                                <div class="totalItemsPrice">
                                                                    <asp:Literal runat="server" Text='<%# Eval("OrderProductAmount")  %>'></asp:Literal>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>


                                                <div class="order-item-result">
                                                    <div class="orderTotalText">
                                                        <asp:Literal runat="server" Text="Order Total:"></asp:Literal>

                                                    </div>
                                                    <div class="orderTotalValue">
                                                        <asp:Literal runat="server" Text='<%# Eval("Amount")  %>'></asp:Literal>

                                                    </div>
                                                </div>
                                                <div class="order-item-action">
                                                    <asp:Button runat='server' OnClick='CancelOrder' Visible='<%# Eval("Status").ToString() == _888MarketplaceApp.Models.Order.Processing  %>' meta:bind='<% DataBind(); %>' Text='Cancel Order' CssClass='btn text-white btn-primary-green' CommandArgument='<%# Eval("Id")  %>' />
                                                    <asp:Button runat='server' OnClick='RefundOrder' Visible='<%# Eval("Status").ToString() == _888MarketplaceApp.Models.Order.Completed  %>' meta:bind='<% DataBind(); %>' Text='Refund' CssClass='btn text-white btn-primary-green' CommandArgument='<%# Eval("Id")  %>' />
                                                    <asp:Button runat='server' OnClick='OrderReceive' Visible='<%# Eval("Status").ToString() == _888MarketplaceApp.Models.Order.Delivering  %>' meta:bind='<% DataBind(); %>' Text='Order Receive' CssClass='btn text-white btn-primary-green' CommandArgument='<%# Eval("Id")  %>'/>
                                                </div>

                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
