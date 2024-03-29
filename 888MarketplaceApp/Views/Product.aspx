<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="_888MarketplaceApp.Views.Product" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <div class="container">
        <div class="row">
            Category
        </div>
        <div class="card mb-4">
            <div class="row">
                <div class="col-md-7 mt-5 ms-3">
                    <asp:Image ID="imgPdt" runat="server" Height="80%" ImageUrl="#" Width="80%" />
                    <div class="mt-3">
                        <asp:ImageButton ID="imgBtnPdt1" runat="server" CssClass="me-3" Width="50px" Height="50px" ImageUrl="~/Images/orange_shoe_1.jpg" />
                        <asp:ImageButton ID="imgBtnPdt2" runat="server" CssClass="me-3" Width="50px" Height="50px" ImageUrl="~/Images/orange_shoe_2.jpg" />
                    </div>
                </div>
                <div class="col-md-5 mt-5 me-3">
                    <div class="form-group">
                        <asp:Label ID="lblPdtName" runat="server" Text="Product " ></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtDesc" runat="server" Text="Description: " ></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="Price (RM): " ></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock Quantity (Unit): " ></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
