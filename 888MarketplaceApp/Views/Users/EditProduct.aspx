<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.EditProduct" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .imgDelBtn {
            width: 30px;
            height: 30px;
            color: white;
            background-color: red;
            border-radius: 15px;
            border: 0px solid white;
            line-height: 3px;
            float: right;
        }
    </style>
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="actionMessages">
        <ContentTemplate>
            <div class="card mx-auto" runat="server" id="cardActionMessage" tabindex="-1" aria-hidden="true" style="width: 60%">
                <asp:Label runat="server" ID="resultMessage"></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="container">
        <h2 class="m-3 fw-bolder" style="color: #38d39f">Edit product</h2>
        <div class="card m-2 p-4 mb-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <h5 class="fw-bold mb-2" style="font-family: var(--bs-font-sans-serif);">Product Images</h5>
                        <asp:Repeater runat="server" ID="imgRepeater">
                            <ItemTemplate>
                                <div class="col-3">
                                    <div style="float: right;">
                                        <asp:Button runat="server" OnClick="delImgFromList" CommandArgument="<%# Container.DataItem.ToString() ?? string.Empty %>" CssClass="imgDelBtn" Text="X" />
                                    </div>
                                    <asp:Image ID="upPdtImg" runat="server" ImageUrl="<%# Container.DataItem.ToString() ?? string.Empty %>" Style="max-width: 90%; max-height: 100%;" />
                                    <img id="imgPdt" src="#" style="display: none" /><br />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:FileUpload ID="imageUpl" runat="server" onchange="updateImage(event)" AllowMultiple="true" class="mt-5" />
                    </div>
                </div>

                <div class="col-md-12 mt-3">
                    <asp:HiddenField runat="server" ID="hiddenProdID" Value="" />
                    <div class="form-group">
                        <asp:Label ID="lblPdtName" runat="server" Text="Name: "></asp:Label>
                        <asp:TextBox ID="txtPdtName" runat="server" CssClass="form-control mt-2" placeholder="Product Name" value=""></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtDesc" runat="server" Text="Description: "></asp:Label>
                        <asp:TextBox ID="txtPdtDesc" runat="server" CssClass="form-control mt-2" placeholder="Product Description" value=""></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="Price (RM): "></asp:Label>
                        <asp:TextBox ID="inPdtPrice" type="number" runat="server" CssClass="form-control mt-2" Style="width: 30%" step="0.01" value=""></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock Quantity (Unit): "></asp:Label>
                        <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" Style="width: 30%" value=""></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtCatg" runat="server" Text="Category: "></asp:Label>
                        <select id="selPdtCatg" runat="server" class="form-control mt-2" style="width: 25%; appearance: auto">
                        </select>
                    </div>
                    <br />
                    <div class="form-group mt-5">
                        <asp:Button runat="server" OnClick="editProduct" Text="Edit Product" CssClass="site-btn btn btn-primary" />
                    </div>
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
