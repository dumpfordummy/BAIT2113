<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="_888MarketplaceApp.Views.ChangePassword" %>

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
                                            <li class="nav-item acc-nav-item-active"><a class="nav-link acc-nav-link-active" href="/Views/User/ChangePassword">Change Password</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/Views/User/Mypurchases">
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
                                        <p class="card-title-strong">My Account</p>
                                        <div class="card-title-description">Manage your password</div>
                                    </div>
                                    <div class="card-content">
                                        <table class="card-table" style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="OldPassword">Current Password</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="OldPassword" CssClass="form-control" TextMode="Password" />
                                                    <asp:RequiredFieldValidator ID="oldPasswordValidator" runat="server" ControlToValidate="OldPassword" CssClass="text-danger" ErrorMessage="The current password field is required." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="NewPassword">New Password</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="NewPassword" CssClass="form-control" TextMode="Password" />
                                                    <asp:CustomValidator ID="passwordValidator" runat="server" ControlToValidate="NewPassword" CssClass="text-danger" ErrorMessage="" OnServerValidate="PasswordValidator" ValidateEmptyText="true"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm New Password</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                                                    <asp:CustomValidator ID="confirmPasswordValidator" runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="" OnServerValidate="ConfirmPasswordValidator" ValidateEmptyText="true"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="Result" CssClass="text-danger"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;
                                                </td>
                                                <td>
                                                    <asp:Button runat="server" OnClick="ChangePasswordClick" Text="Change Password" CssClass="btn text-white btn-primary" />
                                                </td>
                                            </tr>
                                        </table>
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
