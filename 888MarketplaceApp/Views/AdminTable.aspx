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
                                        <h3 class="font-weight-bold mb-0" style="width: 50%; display: inline-block;">Product Listing Table</h3>
                                        <asp:TextBox CssClas="searchTxt" runat="server">Search Product</asp:TextBox>
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
                                                <tr>
                                                    <td>1</td>
                                                    <td>P1000</td>
                                                    <td>Twisties Cheddar Cheese 60g</td>
                                                    <td>5.00</td>
                                                    <td>10</td>
                                                    <td>
                                                        <asp:Button ID="btnView" runat="server" Text="View" />&nbsp
                                                        <asp:Button ID="btnBan" runat="server" Text="Ban" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>P1001</td>
                                                    <td>Nike AirForce</td>
                                                    <td>305.00</td>
                                                    <td>2</td>
                                                    <td>
                                                        <asp:Button CssClass="btnView" runat="server" Text="View" />&nbsp
                                                        <asp:Button CssClass="btnBan" runat="server" Text="Ban" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>P1002</td>
                                                    <td>Team Victor T-Shirt (Black)</td>
                                                    <td>50.00</td>
                                                    <td>1</td>
                                                    <td>
                                                        <asp:Button CssClass="btnView" runat="server" Text="View" />&nbsp
                                                        <asp:Button CssClass="btnBan" runat="server" Text="Ban" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>P1003</td>
                                                    <td>Apple Watch Series 9 Aluminium Case with Sport Band GPS Only</td>
                                                    <td>1898.00 </td>
                                                    <td>20</td>
                                                    <td>
                                                        <asp:Button CssClass="btnView" runat="server" Text="View" />&nbsp
                                                        <asp:Button CssClass="btnBan" runat="server" Text="Ban" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>P1004</td>
                                                    <td>NEW ERA MLB NY New York Yankees Baseball Cap</td>
                                                    <td>80.00 </td>
                                                    <td>12</td>
                                                    <td>
                                                        <asp:Button CssClass="btnView" runat="server" Text="View" />&nbsp
                                                        <asp:Button CssClass="btnBan" runat="server" Text="Ban" />
                                                    </td>
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
