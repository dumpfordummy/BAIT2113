<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="_888MarketplaceApp.Views.Product" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <div class="container">
        <div class="row">
            <p class="ps-3 fw-bold">Category > Shoes > Orange Shoe (Men)</p>
        </div>
        <div class="card mb-4">
            <div class="row">
                <div class="col-md-6 mt-5">
                    <asp:Image ID="imgPdt" runat="server" Height="80%" ImageUrl="#" Width="80%" CssClass="mx-auto d-block" />
                    <div class="mt-3 mx-auto" style="width: 80%">
                        <asp:ImageButton ID="imgBtnPdt1" runat="server" CssClass="imgGallBtn me-3" Width="50px" Height="50px" ImageUrl="~/Images/orange_shoe_1.jpg" OnClick="imgBtnPdt_Click" />
                        <asp:ImageButton ID="imgBtnPdt2" runat="server" CssClass="imgGallBtn me-3" Width="50px" Height="50px" ImageUrl="~/Images/orange_shoe_2.jpg" OnClick="imgBtnPdt_Click" />
                    </div>
                </div>
                <div class="col-md-5 mt-5 ">
                    <div class="form-group">
                        <asp:Label ID="lblPdtName" runat="server" Text="Product Name" CssClass="fw-bold" style="font-size: 28px" ></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="RM XXX" style="font-size: 20px;" ></asp:Label>
                    </div>
                    <div class="form-group">
                        <br /><br />
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock (Unit): " ></asp:Label>
                        <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" style="width: 30%" min="1" max="10" ></asp:TextBox>
                    </div>
                </div>

                <hr class="mx-auto" style="width: 95%" />
                <div class="col-md-12 px-5">
                    <h5 class="fw-bold mb-2" style="font-family: var(--bs-font-sans-serif);">Item Description</h5>
                    <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur nunc. Integer bibendum volutpat justo porttitor aliquet. Cras sagittis dolor ut nisl finibus efficitur. Sed ullamcorper sapien viverra elit bibendum fringilla. Nam in vehicula velit. Vestibulum a vulputate nisi, ut blandit dolor. Donec scelerisque lacus sed arcu scelerisque, non lacinia justo cursus. Vivamus lacinia, orci nec finibus accumsan, odio dolor consequat velit, vel ultrices nisi lacus condimentum eros. Quisque tincidunt malesuada dui id euismod. Maecenas auctor massa nulla. Pellentesque dignissim et dui nec mattis. Suspendisse sit amet sollicitudin mauris. Mauris consequat purus sagittis nisi cursus dapibus. </p>
                </div>

                <hr class="mx-auto" style="width: 95%" />
                <div class="col-md-12 px-5">
                    <h5 class="fw-bold mb-2" style="font-family: var(--bs-font-sans-serif);">Reviews</h5>
                    <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur nunc. Integer bibendum volutpat justo porttitor aliquet. Cras sagittis dolor ut nisl finibus efficitur. Sed ullamcorper sapien viverra elit bibendum fringilla. Nam in vehicula velit. Vestibulum a vulputate nisi, ut blandit dolor. Donec scelerisque lacus sed arcu scelerisque, non lacinia justo cursus. Vivamus lacinia, orci nec finibus accumsan, odio dolor consequat velit, vel ultrices nisi lacus condimentum eros. Quisque tincidunt malesuada dui id euismod. Maecenas auctor massa nulla. Pellentesque dignissim et dui nec mattis. Suspendisse sit amet sollicitudin mauris. Mauris consequat purus sagittis nisi cursus dapibus. 
                    </p>
                    <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur nunc. Integer bibendum volutpat justo porttitor aliquet. Cras sagittis dolor ut nisl finibus efficitur. Sed ullamcorper sapien viverra elit bibendum fringilla. Nam in vehicula velit. Vestibulum a vulputate nisi, ut blandit dolor. Donec scelerisque lacus sed arcu scelerisque, non lacinia justo cursus. Vivamus lacinia, orci nec finibus accumsan, odio dolor consequat velit, vel ultrices nisi lacus condimentum eros. Quisque tincidunt malesuada dui id euismod. Maecenas auctor massa nulla. Pellentesque dignissim et dui nec mattis. Suspendisse sit amet sollicitudin mauris. Mauris consequat purus sagittis nisi cursus dapibus. 
                    </p>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
