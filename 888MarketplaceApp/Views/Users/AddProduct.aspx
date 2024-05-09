<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.AddProduct" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="actionMessages">
        <ContentTemplate>
            <div class="card mx-auto" runat="server" id="cardActionMessage" tabindex="-1" aria-hidden="true" style="width: 60%">
                <asp:Label runat="server" ID="resultMessage"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="container">
        <h2 class="m-3 fw-bolder" style="color: #38d39f">Add a product</h2>
        <div class="card m-2 p-4 mb-4">
            <div class="col-md-6">
                <div class="row">
                    <div class="form-group">
                        <h5 class="fw-bold mb-2">Product Images</h5>
                        <img id="imgPdt" src="#" style="display: none" /><br />
                        <asp:FileUpload ID="imageUpl" runat="server" AllowMultiple="true" onchange="updateImage(event)" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group mt-3">
                    <asp:Label ID="lblPdtName" runat="server" Text="Name: "></asp:Label>
                    <asp:TextBox ID="txtPdtName" runat="server" CssClass="form-control mt-2" placeholder="Product Name"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Label ID="lblPdtDesc" runat="server" Text="Description: "></asp:Label>
                    <asp:TextBox ID="txtPdtDesc" runat="server" CssClass="form-control mt-2" TextMode="MultiLine" Rows="4" placeholder="Product Description" Style="white-space: pre-wrap"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Label ID="lblPdtPrice" runat="server" Text="Price (RM): "></asp:Label>
                    <asp:TextBox ID="inPdtPrice" type="number" step="0.01" runat="server" CssClass="form-control mt-2" Style="width: 30%"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Label ID="lblPdtQty" runat="server" Text="Stock Quantity (Unit): "></asp:Label>
                    <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" Style="width: 30%"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Label ID="lblPdtCatg" runat="server" Text="Category: "></asp:Label>
                    <select id="selPdtCatg" runat="server" class="form-control mt-2">
                    </select>
                </div>
                <br />
                <div class="form-group mt-5">
                    <asp:Button runat="server" OnClick="AddProductToDB" Text="Add Product" CssClass="site-btn btn btn-primary" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function updateImage(event) {
            const file = event.target.files[0];

            let url = window.URL.createObjectURL(file);

            document.getElementById("imgPdt").src = url;
            document.getElementById("imgPdt").style.display = "block";
        };

    </script>
</asp:Content>
