<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="_888MarketplaceApp.Views.ResetPasswordConfirmation" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <h3>Got it! Your password has been updated</h3>
                    <p class="mb-4">888 Marketplace password has been updated and works like a charm. Nice job! Login to access your account. </p>
                </div>
                <asp:Button runat="server" OnClick="BackToHome" Text="Back To Home" CssClass="btn text-white btn-block btn-primary" />
            </div>
        </div>
    </div>
    <script src="/Scripts/App/Account/forgotpassword.js"></script>
</asp:Content>
