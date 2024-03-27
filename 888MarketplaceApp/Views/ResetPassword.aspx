<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="_888MarketplaceApp.Views.ResetPassword" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
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
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>

                        <div class="form-group last mb-4">
                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                            <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="The Confirm Password field is required." />
                        </div>

                        <asp:Button runat="server" OnClick="ConfirmResetPassword" Text="Confirm" CssClass="btn text-white btn-block btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/Scripts/App/Account/forgotpassword.js"></script>
</asp:Content>
