<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="_888MarketplaceApp.Views.Product" MasterPageFile="~/Views/Site.Master" ClientIDMode="Static" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <style>
        .rate {
            display: block;
            float: left;
            /*pointer-events: none;*/
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

            .rate:not(:checked) > label:hover, .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }

            .rate > input:checked + label:hover, .rate > input:checked + label:hover ~ label, .rate > input:checked ~ label:hover, .rate > input:checked ~ label:hover ~ label, .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
    </style>

    <div class="container">
        <div class="row">
            <p class="ps-3 fw-bold">Category > Shoes > <%# Eval("Name") %></p>
        </div>
        <div class="card mb-4">
            <div class="row">
                <div class="col-md-6 mt-5">
                    <asp:Image ID="imgPdt" runat="server" Height="80%" ImageUrl="#" Width="80%" CssClass="mx-auto d-block" />
                    <div class="mt-3 mx-auto" style="width: 80%">
                        <asp:Repeater ID="imgBtnRepeater" runat="server">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CssClass="imgGallBtn me-3 imgPdtBtn" Width="50px" Height="50px" ImageUrl="<%# Container.DataItem.ToString() ?? string.Empty %>" OnClick="imgPdtBtn_Click" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-md-5 mt-5 ">
                    <div class="form-group">
                        <asp:Label ID="lblPdtName" runat="server" Text="Product Name" CssClass="fw-bold" Style="font-size: 28px"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPdtPrice" runat="server" Text="RM " Style="font-size: 20px;"></asp:Label>
                    </div>
                    <div class="form-group">
                        <br />
                        <br />
                        <asp:Label ID="lblPdtQty" runat="server" Text="Stock (Unit): "></asp:Label>
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
                    <br />
                    <div class="rate">
                        <input type="radio" id="v2_star5" name="rate2" value="5" />
                        <label for="v2_star5" title="text">5 stars</label>
                        <input type="radio" id="v2_star4" name="rate2" value="4" />
                        <label for="v2_star4" title="text">4 stars</label>
                        <input type="radio" id="v2_star3" name="rate2" value="3" />
                        <label for="v2_star3" title="text">3 stars</label>
                        <input type="radio" id="v2_star2" name="rate2" value="2" />
                        <label for="v2_star2" title="text">2 stars</label>
                        <input type="radio" id="v2_star1" name="rate2" value="1" />
                        <label for="v2_star1" title="text">1 star</label>
                    </div>
                    <asp:TextBox runat="server" ID="txtPdtReview" TextMode="MultiLine" CssClass="form-control" Rows="4"></asp:TextBox>
                    <br />
                    <asp:Repeater ID="PdtReviewRepeater" runat="server">
                        <ItemTemplate>
                            <p class="fw-light" style="font-family: var(--bs-font-sans-serif)">
                                <% for (int i = 0; i < int.Parse(Eval("Rating").ToString()); i++) { %>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                <% } %>
                                <br />
                                <%# Eval("Content") %>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
