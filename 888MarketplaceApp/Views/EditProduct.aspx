<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="_888MarketplaceApp.Views.EditProduct" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .imgDelBtn{
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <div class="container">
        <h2 class="m-3 fw-bolder" style="color: #38d39f">Edit product</h2>
        <div class="card m-2 p-4 mb-4">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <h5 class="fw-bold mb-2" style="font-family: var(--bs-font-sans-serif);">Product Images</h5>
                        <div class="col-3">
                            <div style="float: right;">
                                <button class="imgDelBtn" type="submit" name="delImage" value="~/Images/red_shoe.jpg"><i class="fa fa-close" style="font-size: 20px;"></i></button>
                            </div>
                            <asp:Image ID="upPdtImg" runat="server" ImageUrl="~/Images/red_shoe.jpg" style="max-width: 250px; max-height: 250px;" />
                        </div>                        
                    </div>
                </div>

                <div class="col-md-12 mt-3">
                    <div class="form-group">
                        <asp:Label ID="lblPdtName" runat="server" Text="Name: " ></asp:Label>
                        <asp:TextBox ID="txtPdtName" runat="server" CssClass="form-control mt-2" placeholder="Product Name" value="Red Shoe" ></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtDesc" runat="server" Text="Description: " ></asp:Label>
                        <asp:TextBox ID="txtPdtDesc" runat="server" CssClass="form-control mt-2" placeholder="Product Description" value="Running/Hiking shoe for men" ></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="Price (RM): " ></asp:Label>
                        <asp:TextBox ID="inPdtNo" type="number" runat="server" CssClass="form-control mt-2" style="width: 30%" value="299" ></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock Quantity (Unit): " ></asp:Label>
                        <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" style="width: 30%" value="30"></asp:TextBox>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Label ID="lblPdtCatg" runat="server" Text="Category: " ></asp:Label>
                        <select id="selPdtCatg" runat="server" class="form-control mt-2">
                            <option>Clothing & Apparel</option>
                            <option>Electronic Devices/Accessories</option>
                        </select>
                    </div>
                    <br />
                    <div class="form-group mt-5">
                        <button type="submit" class=" btn btn-primary" value="editProduct">Update Product</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</asp:Content>
