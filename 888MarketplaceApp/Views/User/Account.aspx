<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="_888MarketplaceApp.Views.Account" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper">
            <div class="acc-main-panel max-width">
                <div class="acc-content-wrapper center-form">

                    <div class="nav-panel">
                        <nav class="acc-sidebar acc-sidebar-offcanvas" id="sidebar">
                            <ul class="nav">
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="true" aria-controls="auth">
                                        <i class="ti-user menu-icon"></i>
                                        <span class="menu-title">My Account</span>
                                        <i class="menu-arrow"></i>
                                    </a>
                                    <div class="collapse" id="auth">
                                        <ul class="nav flex-column sub-menu">
                                            <li class="nav-item acc-nav-item-active"><a class="nav-link acc-nav-link-active" href="/Views/User/Account">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link" href="/Views/User/ChangePassword">Change Password</a></li>
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
                                        <div class="card-title-description">Browse and manage your profile</div>
                                    </div>
                                    <div class="card-content">
                                        <table class="card-table" style="width: 100%;">
                                            <asp:HiddenField ID="hiddenId" runat="server" />
                                            <tr>
                                                <td colspan="2" class="centered">
                                                    <asp:Image ID="ProfileAvatar" CssClass="profileImg" runat="server" AlternateText="Example Image" />
                                                    <br />
                                                    <asp:FileUpload ID="ProfileAvatarUpload" runat="server" accept="image/*" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="Username">Username</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="Username" CssClass="form-control" />
                                                    <asp:CustomValidator ID="usernameValidator" runat="server" ControlToValidate="Username" CssClass="text-danger" ErrorMessage="" OnServerValidate="UsernameValidator" ValidateEmptyText="true"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The Email field is required." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="FirstName">First Name</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ID="FirstNameValidator" ControlToValidate="FirstName" CssClass="text-danger" ErrorMessage="The First Name field is required." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="LastName">Last Name</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ID="LastNameValidator" ControlToValidate="LastName" CssClass="text-danger" ErrorMessage="The Last Name field is required." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="Phone">Phone Number</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone" />
                                                    <asp:CustomValidator ID="phoneValidator" runat="server" ControlToValidate="Phone" CssClass="text-danger" ErrorMessage="" OnServerValidate="PhoneValidator" ValidateEmptyText="true"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" AssociatedControlID="Address">Address</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator runat="server" ID="AddressValidator" ControlToValidate="Address" CssClass="text-danger" ErrorMessage="The Address field is required." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="centered">
                                                    <asp:Label runat="server" ID="Result" CssClass="text-danger"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="centered">
                                                    <asp:Button runat="server" OnClick="SubmitEditAccount" Text="Confirm" CssClass="btn text-white btn-block btn-primary" />
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
