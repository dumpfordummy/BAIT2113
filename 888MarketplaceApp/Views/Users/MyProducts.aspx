<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProducts.aspx.cs" Inherits="_888MarketplaceApp.Views.Users.MyProducts" EnableEventValidation="true" MasterPageFile="~/Views/Site.Master" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="deleteConfirmPopup">
        <ContentTemplate>
            <div class="card mx-auto" tabindex="-1" aria-hidden="true" style="width: 60%">
                <asp:HiddenField runat="server" ID="delProductID" Value="" />
                <div class="m-3">
                    <div class="d-flex flex-column" >
                        <div class="modal-header p-3">
                            <h4 class="modal-title">Product Delete Confirmation</h4>
                        </div>
                        <div class="modal-body p-3">
                            <asp:Label runat="server" ID="lblDelConfirm"></asp:Label>
                        </div>
                        <div class="modal-footer p-3">
                            <asp:Button runat="server" ID="btnCancelConfirm" OnClick="toggleModalOff" CssClass="btn btn-primary mx-3" Text="Cancel" />
                            <asp:Button runat="server" ID="btnDeleteConfirm" OnClick="deleteProduct" CssClass="btn btn-danger" Text="Delete" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

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
                                            <li class="nav-item"><a class="nav-link" href="/Views/Users/Account">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/Views/Users/ChangePassword">Change Password</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link acc-nav-item-active acc-nav-link-active" href="/Views/User/MyPurchases">
                                        <i class="ti-view-list-alt menu-icon acc-nav-link-active"></i>
                                        <span class="menu-title">My Purchase</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/Views/Users/MyProducts">
                                        <i class="fa fa-archive menu-icon"></i>
                                        <span class="menu-title">My Products</span>
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
                                        <p class="card-title-strong">My Products</p>
                                        <div class="card-title-description">Manage your products</div>
                                    </div>

                                    <div class="card-content">
                                        <a class="btn btn-primary site-btn mb-5" runat="server" href="/Views/Users/AddProduct.aspx">Add product</a>
                                        <asp:Repeater runat="server" ID="myProdList">
                                            <ItemTemplate>
                                                <div class="col-lg-3 col-md-4 col-sm-6 mix Cat<%# Eval("Product.CategoryId") %>">
                                                    <div class="featured__item">
                                                        <div class="featured__item__pic set-bg" data-setbg="<%# Eval("Product.ImagePaths").ToString().Split(';')[0] %>">
                                                            <ul class="featured__item__pic__hover">
                                                                <li><a href="/Views/Users/EditProduct?Id=<%# Eval("Product.Id") %> "><i class="fa fa-pencil-square-o"></i></a></li>
                                                                <li>
                                                                    <asp:LinkButton runat="server" ID="toggleModalBtn" OnClick="toggleModalOn" Text='<i class="fa fa-trash"></i>' CommandArgument='<%# Eval("Product.Id") %>' CssClass="btn-danger" /></li>
                                                            </ul>
                                                        </div>
                                                        <div class="featured__item__text">
                                                            <h6><a href="#"><%# Eval("Product.Name") %></a></h6>
                                                            <h5>RM <%# Eval("Product.Price") %></h5>
                                                        </div>
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
    </div>
    <script src="/Scripts/main.js"></script>
</asp:Content>
