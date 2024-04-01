<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="MyPurchases.aspx.cs" Inherits="_888MarketplaceApp.Views.MyPurchases" %>

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
                                            <li class="nav-item"><a class="nav-link" href="/Account">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/ChangePassword">Change Password</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/Mypurchases">
                                        <i class="ti-view-list-alt menu-icon"></i>
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
                                    <div class="card-content">
                                        <div class="order-information">
                                            <div class="StatusName">
                                                <asp:Literal runat="server" Text="To Ship"></asp:Literal>

                                            </div>
                                            <div class="StatusDescription">
                                                <asp:Literal runat="server" Text="Your order is being prepared"></asp:Literal>
                                            </div>
                                        </div>
                                        <div class="order-item">
                                            <div class="itemImg">
                                                <asp:Image CssClass="purchaseItem" runat="server" ImageUrl="~/Content/Images/Admin/faces/face1.jpg" AlternateText="Example Image" />
                                            </div>
                                            <div class="itemContent">
                                                <div class="itemDetails">
                                                    <div class="itemTitle">
                                                        <asp:Literal runat="server" Text="Gaming Laptop 128GB RAM RTX5090 I9-15900k"></asp:Literal>
                                                    </div>
                                                    <div class="itemDescription">
                                                        <asp:Literal runat="server" Text="This is a potato laptop that only able to play roblox"></asp:Literal>
                                                    </div>
                                                    <div class="itemCategory">
                                                        <asp:Literal runat="server" Text="Electronics"></asp:Literal>
                                                    </div>
                                                    <div class="itemQuantity">
                                                        <asp:Literal runat="server" Text="x1"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="totalItemsPrice">
                                                    <asp:Literal runat="server" Text="RM2000.00"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-item">
                                            <div class="itemImg">
                                                <asp:Image CssClass="purchaseItem" runat="server" ImageUrl="~/Content/Images/Admin/faces/face1.jpg" AlternateText="Example Image" />
                                            </div>
                                            <div class="itemContent">
                                                <div class="itemDetails">
                                                    <div class="itemTitle">
                                                        <asp:Literal runat="server" Text="Pineapple P15 Pro MAX 1TB Purple"></asp:Literal>
                                                    </div>
                                                    <div class="itemDescription">
                                                        <asp:Literal runat="server" Text="This is a potato phone that only able to play minecraft"></asp:Literal>
                                                    </div>
                                                    <div class="itemCategory">
                                                        <asp:Literal runat="server" Text="Electronics"></asp:Literal>
                                                    </div>
                                                    <div class="itemQuantity">
                                                        <asp:Literal runat="server" Text="x1"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="totalItemsPrice">
                                                    <asp:Literal runat="server" Text="RM3000.00"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-item-result">
                                            <div class="orderTotalText">
                                                <asp:Literal runat="server" Text="Order Total:"></asp:Literal>

                                            </div>
                                            <div class="orderTotalValue">
                                                <asp:Literal runat="server" Text="RM5000.00"></asp:Literal>

                                            </div>
                                        </div>
                                        <div class="order-item-action">
                                            <%--<asp:Button runat="server" OnClick="RateOrder" Text="Rate" CssClass="btn text-white btn-primary-green" />--%>
                                            <asp:Button runat="server" OnClick="CancelOrder" Text="Cancel Order" CssClass="btn text-white btn-primary-green" />
                                            <%--<asp:Button runat="server" OnClick="OrderReceive" Text="Order Receive" CssClass="btn text-white btn-primary-green" />--%>
                                        </div>
                                    </div>

                                    <div class="card-content">
                                        <div class="order-information">
                                            <div class="StatusName">
                                                <asp:Literal runat="server" Text="To Ship"></asp:Literal>

                                            </div>
                                            <div class="StatusDescription">
                                                <asp:Literal runat="server" Text="Your order is being prepared"></asp:Literal>
                                            </div>
                                        </div>
                                        <div class="order-item">
                                            <div class="itemImg">
                                                <asp:Image CssClass="purchaseItem" runat="server" ImageUrl="~/Content/Images/Admin/faces/face1.jpg" AlternateText="Example Image" />
                                            </div>
                                            <div class="itemContent">
                                                <div class="itemDetails">
                                                    <div class="itemTitle">
                                                        <asp:Literal runat="server" Text="Gaming Laptop 128GB RAM RTX5090 I9-15900k"></asp:Literal>
                                                    </div>
                                                    <div class="itemDescription">
                                                        <asp:Literal runat="server" Text="This is a potato laptop that only able to play roblox"></asp:Literal>
                                                    </div>
                                                    <div class="itemCategory">
                                                        <asp:Literal runat="server" Text="Electronics"></asp:Literal>
                                                    </div>
                                                    <div class="itemQuantity">
                                                        <asp:Literal runat="server" Text="x1"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="totalItemsPrice">
                                                    <asp:Literal runat="server" Text="RM2000.00"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-item">
                                            <div class="itemImg">
                                                <asp:Image CssClass="purchaseItem" runat="server" ImageUrl="~/Content/Images/Admin/faces/face1.jpg" AlternateText="Example Image" />
                                            </div>
                                            <div class="itemContent">
                                                <div class="itemDetails">
                                                    <div class="itemTitle">
                                                        <asp:Literal runat="server" Text="Pineapple P15 Pro MAX 1TB Purple"></asp:Literal>
                                                    </div>
                                                    <div class="itemDescription">
                                                        <asp:Literal runat="server" Text="This is a potato phone that only able to play minecraft"></asp:Literal>
                                                    </div>
                                                    <div class="itemCategory">
                                                        <asp:Literal runat="server" Text="Electronics"></asp:Literal>
                                                    </div>
                                                    <div class="itemQuantity">
                                                        <asp:Literal runat="server" Text="x1"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="totalItemsPrice">
                                                    <asp:Literal runat="server" Text="RM3000.00"></asp:Literal>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order-item-result">
                                            <div class="orderTotalText">
                                                <asp:Literal runat="server" Text="Order Total:"></asp:Literal>

                                            </div>
                                            <div class="orderTotalValue">
                                                <asp:Literal runat="server" Text="RM5000.00"></asp:Literal>

                                            </div>
                                        </div>
                                        <div class="order-item-action">
                                            <%--<asp:Button runat="server" OnClick="RateOrder" Text="Rate" CssClass="btn text-white btn-primary-green" />--%>
                                            <asp:Button runat="server" OnClick="CancelOrder" Text="Cancel Order" CssClass="btn text-white btn-primary-green" />
                                            <%--<asp:Button runat="server" OnClick="OrderReceive" Text="Order Receive" CssClass="btn text-white btn-primary-green" />--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
