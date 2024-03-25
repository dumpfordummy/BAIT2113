<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_888MarketplaceApp.Views.Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="homeBody">
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 order-md-2">
                    <img src="/Content/Images/login-bg.svg" alt="Image" class="img-fluid" />
                </div>
                <div class="col-md-6 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <h3>Sign In</h3>
                                <p class="mb-4">Welcome to 888 Marketplace! Please login</p>
                            </div>
                            <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="Literal1" />
                                </p>
                            </asp:PlaceHolder>

                            <div class="form-group first">
                                <asp:Label runat="server" AssociatedControlID="Username">Username</asp:Label>
                                <asp:TextBox runat="server" ID="Username" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                    CssClass="text-danger" ErrorMessage="The username field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>

                            <div class="d-flex mb-5 align-items-center">
                                <div class="control control--checkbox mb-0">
                                    <span class="ml-auto">
                                        <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                    </span>
                                    <asp:CheckBox runat="server" ID="RememberMe" Checked="true" />
                                    <div class="control__indicator"></div>
                                </div>
                                <span class="ml-auto">
                                    <asp:HyperLink ID="Forgot" CssClass="forgot-pass" runat="server" NavigateUrl="/Forgot">Forgot Password</asp:HyperLink></span>
                            </div>

                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn text-white btn-block btn-primary" />

                            <div class="alt-url">
                                <span>Not a member? </span>
                                <asp:HyperLink ID="Register" runat="server" NavigateUrl="/Register">Register</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/Scripts/App/Account/login.js"></script>
</asp:Content>
