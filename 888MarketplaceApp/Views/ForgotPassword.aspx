﻿<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="_888MarketplaceApp.Views.ForgotPassword" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="head">
    <link rel="stylesheet" href="/Content/App/Login/style.css">
    <script src="/Scripts/App/Account/forgotpassword.js"></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="body">
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="mb-4">
                            <h3>Forgot Password</h3>
                            <p class="mb-4">Enter the email of your account</p>
                        </div>
                        <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="Literal1" />
                            </p>
                        </asp:PlaceHolder>

                        <div class="form-group first">
                            <asp:Label runat="server" AssociatedControlID="Email">Email</asp:Label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The Email field is required." />
                        </div>

                        <asp:Button runat="server" OnClick="SendVerification" Text="Send Verification" CssClass="btn text-white btn-block btn-primary" />
                        <div class="alt-url">
                            <asp:HyperLink ID="back" runat="server" NavigateUrl="/login">Back To Login</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>