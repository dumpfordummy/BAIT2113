<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="_888MarketplaceApp.Views.Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>An unexpected error occurred, please contact cyhoo0528@gmail.com if the problem still persist.</h2>
            <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="text-danger"></asp:Label>
            <a href="/" class="btn">Home</a>
        </div>
    </form>
</body>
</html>
