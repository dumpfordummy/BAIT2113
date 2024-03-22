<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_888MarketplaceApp.Views.Register" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="head">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/Content/App/Login/login.css">
    <link rel="stylesheet" href="/Content/icomoon.css">
    <script src="/Scripts/App/Account/register.js"></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="body">
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-6 order-md-2">
                    <img src="/Content/Images/login-bg.svg" alt="Image" class="img-fluid">
                </div>
                <div class="col-md-6 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <h3>Sign In to <strong>Colorlib</strong></h3>
                                <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
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
                                <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The Email field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="The Confirm Password field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="FirstName">First Name</asp:Label>
                                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" CssClass="text-danger" ErrorMessage="The First Name field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="LastName">LastName</asp:Label>
                                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" CssClass="text-danger" ErrorMessage="The Last Name field is required." />
                            </div>
                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="Phone">Phone Number</asp:Label>
                                <asp:TextBox runat="server" ID="Phone" CssClass="form-control" TextMode="Phone" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone" CssClass="text-danger" ErrorMessage="The Phone Number field is required." />
                            </div>

                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="Address">Address</asp:Label>
                                <asp:TextBox runat="server" ID="Address" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" CssClass="text-danger" ErrorMessage="The Address field is required." />
                            </div>


                            <asp:Button runat="server" OnClick="RegisterUser" Text="Register" CssClass="btn text-white btn-block btn-primary" />

                            <div class="not-member">
                                <span>Already a member? </span>
                                <asp:HyperLink ID="LoginBtn" runat="server" NavigateUrl="/Login">Login</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
