<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminTable.aspx.cs" Inherits="_888MarketplaceApp.AdminTable" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="adminTemporaryPlaceholder">
    <link rel="stylesheet" href="/Content/css/adminTemp2.css" type="text/css" />
</asp:Content>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">

        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="AdminDashboard.aspx">
                            <i class="ti-shield menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminChart.aspx">
                            <i class="ti-pie-chart menu-icon"></i>
                            <span class="menu-title">Charts</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminTable.aspx">
                            <i class="ti-view-list-alt menu-icon"></i>
                            <span class="menu-title">Tables</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div>
                                        <h3 class="font-weight-bold mb-0" style="width: 55%; display: inline-block;">Product Listing Table</h3>
                                        <asp:TextBox CssClas="searchTxt" runat="server" Style="margin-left: 20%;">Search Product</asp:TextBox>
                                        <asp:Button CssClass="btn btnGreen btn-icon-text btn-rounded" runat="server" Text="Search" />


                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Product ID</th>
                                                    <th>Product Name</th>
                                                    <th>Price (RM)</th>
                                                    <th>Quantity</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                    <asp:Repeater ID="AdminTableRepeater" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="adminNumber">
                                                                    <%# Container.ItemIndex + 1 %>
                                                                </td>
                                                                <td class="adminProductID">
                                                                    <%# Eval("Id") %>
                                                                </td>
                                                                <td class="adminProductName">
                                                                    <%# Eval("Name") %>                                          
                                                                </td>
                                                                <td class="adminProductPrice">
                                                                    <%# Eval("Price") %>  
                                                                </td>
                                                                <td class="adminProductQuantity">
                                                                    <%# Eval("Quantity") %>  
                                                                </td>
                                                                <td>
                                                                    <asp:Button CssClass="btnView" runat="server" Text="View"  OnClick="viewClick" CommandArgument='<%# Eval("Id")  %>' />&nbsp
                                                                    <asp:Button CssClass="btnBan" runat="server" Text="Ban" OnClick="banClick" CommandArgument='<%# Eval("Id")  %>' />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="product__pagination">
                                            <a href="#">1</a>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>

        <!-- partial -->
    </div>
    <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
    </div>

    <!-- plugins:js -->
    <script src="/Content/App/admin/vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <script src="/Content/App/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/Scripts/App/Admin/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="/Scripts/App/Admin/off-canvas.js"></script>
    <script src="/Scripts/App/Admin/hoverable-collapse.js"></script>
    <script src="/Scripts/App/Admin/template.js"></script>
    <script src="/Scripts/App/Admin/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="/Scripts/App/Admin/chart.js"></script>
    <!-- End custom js for this page-->
</asp:Content>
