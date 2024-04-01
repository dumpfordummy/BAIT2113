<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterConfirmation.aspx.cs" Inherits="_888MarketplaceApp.Views.RegisterConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Activated</title>
    <link rel="stylesheet" href="/Content/css/register-confirmation.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container justify-content-center">
            <div class="content">
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="#38d39f">
                    <circle cx="12" cy="12" r="11" stroke="#38d39f" stroke-width="2" fill="none" />
                    <path fill="#38d39f" d="M9 16.17L4.83 12l-1.42 1.41L9 19 20 7l-1.41-1.41z" />
                </svg>
                <h2>Account Activation Successful</h2>
                <p>Your account is activated successfully, click the button below to go back to the home page.</p>
                <asp:Button runat="server" OnClick="RedirectHome" Text="Back To Home" CssClass="btn text-white btn-primary-green" />
            </div>
        </div>
    </form>
</body>
</html>
