<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="_888MarketplaceApp.Views.ResetPassword" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="bodyContent">
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <asp:PlaceHolder runat="server" ID="InvalidPlaceholder" Visible="false">
                            <p class="text-danger">
                                <asp:Label runat="server" ID="InvalidLabel" CssClass="text-danger">Invalid id or token.</asp:Label>
                                <br />
                                <asp:HyperLink NavigateUrl="/" runat="server" Text="Back Home" />
                            </p>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder runat="server" ID="ValidPlaceholder" Visible="false">
                            <div class="mb-4">
                                <h3>Reset Password</h3>
                                <p class="mb-4">Enter the email of your account</p>
                            </div>

                            <div class="form-group first">
                                <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                                <asp:CustomValidator ID="passwordValidator" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="" OnServerValidate="PasswordValidator" ValidateEmptyText="true"></asp:CustomValidator>
                            </div>

                            <div class="form-group last mb-4">
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                                <asp:CustomValidator ID="confirmPasswordValidator" runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" ErrorMessage="" OnServerValidate="ConfirmPasswordValidator" ValidateEmptyText="true"></asp:CustomValidator>
                            </div>

                            <asp:Label runat="server" ID="Result" CssClass="text-danger"></asp:Label>
                            <br />
                            <asp:PlaceHolder runat="server" ID="HomeUrlPlaceholder" Visible="false">
                                <asp:HyperLink NavigateUrl="/" runat="server" Text="Back Home" />
                            </asp:PlaceHolder>
                            <asp:Button runat="server" OnClick="ConfirmResetPassword" Text="Reset" CssClass="btn text-white btn-block btn-primary" />
                        </asp:PlaceHolder>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/Scripts/App/Account/forgotpassword.js"></script>
</asp:Content>
