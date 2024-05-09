<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" MasterPageFile="~/Views/Site.Master" Inherits="_888MarketplaceApp.Views.Admin.AddCategory" %>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <div class="container">
        <h2 class="m-3 fw-bolder" style="color: #38d39f">Add a category</h2>
        <div class="card m-2 p-4 mb-4">
            <div class="col-md-6">
                <div class="form-group mt-3">
                    <asp:Label ID="catNamelbl" runat="server" Text="Category Name: "></asp:Label>
                    <asp:TextBox ID="catName" runat="server" CssClass="form-control mt-2" placeholder="Category Name"></asp:TextBox>
                </div>
                <div class="form-group mt-3">
                    <asp:Label ID="catDesclbl" runat="server" Text="Category Description: "></asp:Label>
                    <asp:TextBox ID="catDesc" runat="server" CssClass="form-control mt-2" placeholder="Category Description"></asp:TextBox>
                </div>
                <div class="form-group mt-5">
                    <asp:Label ID="Result" runat="server" CssClass="text-danger"></asp:Label>
                    <asp:Button runat="server" OnClick="AddCategoryToDB" Text="Add Category" CssClass="site-btn btn btn-primary" />
                </div>

                <div class="form-group mt-3">
                    <table>
                        <thead>
                            <tr>
                                <th>Category Name</th>
                                <th>Category Description</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="CategoryRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <h5><%# Eval("Name") %></h5>
                                        </td>
                                        <td>
                                            <h5><%# Eval("Description") %></h5>
                                        </td>
                                        <td>
                                            <td class="shoping__cart__item__close">
                                                <asp:Button runat="server" OnClick="DeleteCategory" Text="Delete" CommandArgument='<%# Eval("Id") %>' />
                                            </td>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
