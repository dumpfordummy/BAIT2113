<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="_888MarketplaceApp.Views.Product" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .rate {
            display: inline-flex;
            height: 46px;
            padding: 0 10px;
        }

        .rate:not(:checked) > input {
            position: absolute;
            top: -9999px;
        }

        .rate:not(:checked) > label {
            float: right;
            width: 1em;
            overflow: hidden;
            white-space: nowrap;
            cursor: pointer;
            font-size: 30px;
            color: #ccc;
        }

        .rate:not(:checked) > label:before {
            content: '★ ';
        }

        .rate > input:checked ~ label {
            color: #ffc700;
        }

        .rate:not(:checked) > label:hover,
        .rate:not(:checked) > label:hover ~ label {
            color: #deb217;
        }

        .rate > input:checked + label:hover,
        .rate > input:checked + label:hover ~ label,
        .rate > input:checked ~ label:hover,
        .rate > input:checked ~ label:hover ~ label,
        .rate > label:hover ~ input:checked ~ label {
            color: #c59b08;
        }
    </style>

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
                        <asp:Label ID="lblPdtName" runat="server" Text="Product Name" CssClass="fw-bold" Style="font-size: 28px"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="RM XXX" Style="font-size: 20px;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <br />
                        <br />
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock (Unit): "></asp:Label>
                        <asp:TextBox ID="inPdtQty" type="number" runat="server" CssClass="form-control mt-2" Style="width: 30%" min="1" max="10"></asp:TextBox>
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
                    <asp:Label ID="lblPdtReview" runat="server" Text="Leave your reviews here: "></asp:Label>
                    <div class="rate">
                        <input type="radio" id="star5" name="rate" value="5" />
                        <label for="5star" title="text">5</label>
                        <input type="radio" id="star4" name="rate" value="4" />
                        <label for="4star" title="text">4</label>
                        <input type="radio" id="star3" name="rate" value="3" />
                        <label for="3star" title="text">3</label>
                        <input type="radio" id="star2" name="rate" value="2" />
                        <label for="2star" title="text">2</label>
                        <input type="radio" id="star1" name="rate" value="1" />
                        <label for="1star" title="text">1</label>
                    </div>
                    <asp:TextBox runat="server" ID="txtPdtReview" TextMode="MultiLine" CssClass="form-control" Rows="4"></asp:TextBox>
                    <br />
                    <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">
                        User1 - <i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
                        <br />
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur nunc. Integer bibendum volutpat justo porttitor aliquet. Cras sagittis dolor ut nisl finibus efficitur. Sed ullamcorper sapien viverra elit bibendum fringilla. Nam in vehicula velit. Vestibulum a vulputate nisi, ut blandit dolor. Donec scelerisque lacus sed arcu scelerisque, non lacinia justo cursus. Vivamus lacinia, orci nec finibus accumsan, odio dolor consequat velit, vel ultrices nisi lacus condimentum eros. Quisque tincidunt malesuada dui id euismod. Maecenas auctor massa nulla. Pellentesque dignissim et dui nec mattis. Suspendisse sit amet sollicitudin mauris. Mauris consequat purus sagittis nisi cursus dapibus. 
                    </p>
                    <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">
                        User23 - <i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
                        <br />
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur nunc. Integer bibendum volutpat justo porttitor aliquet. Cras sagittis dolor ut nisl finibus efficitur. Sed ullamcorper sapien viverra elit bibendum fringilla. Nam in vehicula velit. Vestibulum a vulputate nisi, ut blandit dolor. Donec scelerisque lacus sed arcu scelerisque, non lacinia justo cursus. Vivamus lacinia, orci nec finibus accumsan, odio dolor consequat velit, vel ultrices nisi lacus condimentum eros. Quisque tincidunt malesuada dui id euismod. Maecenas auctor massa nulla. Pellentesque dignissim et dui nec mattis. Suspendisse sit amet sollicitudin mauris. Mauris consequat purus sagittis nisi cursus dapibus. 
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
