<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="PaymentSucc.aspx.cs" Inherits="_888MarketplaceApp.Views.Users.PaymentSucc" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <!-- Payment Successful Begin-->
    <section class="checkout spad">
        <div class="container">
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" fill="#38d39f">
                    <circle cx="12" cy="12" r="11" stroke="#38d39f" stroke-width="2" fill="none" />
                    <path fill="#38d39f" d="M9 16.17L4.83 12l-1.42 1.41L9 19 20 7l-1.41-1.41z" />
                </svg>
                <h1>Payment Successful!</h1>
                <p>Thank you for your order. Your payment has been processed successfully</p>
                    <asp:Button runat="server" ID="TrackOrder" class="site-btn" OnClick="TrackingOrder" Text="Track your order"  />
                    <asp:Button runat="server" ID="BackHome" class="site-btn" OnClick="BacktoHome" Text="Continue Shopping"  />
        </div>
    </section>


    <!-- Payment Successful End-->
</asp:Content>
