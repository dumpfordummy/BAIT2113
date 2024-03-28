<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.AddProduct" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <div class="container">
        <h2 class="m-3">Add a product</h2>
        <div class="card m-2 p-4 mb-4">
            <div class="col-md-6">
                <div class="preview-pic tab-content">
                    <div class="row">
                        <div class="form-group">
                            <img id="imgPdt" src="#" style="display: none" /><br/>
                            <asp:FileUpload ID="imageUpl" runat="server" onchange="updateImage()" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label ID="lblPdtName" runat="server" Text="Name: " ></asp:Label>
                    <asp:TextBox ID="txtPdtName" runat="server" CssClass="form-control mt-2" placeholder="Product Name" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPdtDesc" runat="server" Text="Description: " ></asp:Label>
                    <asp:TextBox ID="txtPdtDesc" runat="server" CssClass="form-control mt-2" placeholder="Product Description" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPdtPrice" runat="server" Text="Price (RM): " ></asp:Label>
                    <asp:TextBox ID="inPdtNo" type="number" runat="server" CssClass="form-control mt-2" style="width: 30%" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPdtQty" runat="server" Text="Stock Quantity (Unit): " ></asp:Label>
                    <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" style="width: 30%" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPdtCatg" runat="server" Text="Category: " ></asp:Label>
                    <select id="selPdtCatg" runat="server" class="form-control mt-2">
                        <option>Clothing & Apparel</option>
                        <option>Electronic Devices/Accessories</option>
                    </select>
                </div>
                <br />
                <div class="form-group mt-5">
                    <button type="submit" class=" btn btn-primary" value="addProduct">Add Product</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript">
        imageUpl.onchange = evt => {
            const [file] = imageUpl.files;
            if (file) {
                imgPdt.src = URL.createObjectURL(file);
            }
        };

        function updateImage() {
            var elem = document.getElementById("imgPdt");
            elem.style.display = "block";
        };
        
    </script>
</asp:Content>
