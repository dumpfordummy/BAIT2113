<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="_888MarketplaceApp.Views.AdminDashboard" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="adminTemporaryPlaceholder">
    <link rel="stylesheet" href="/Content/css/adminTemp2.css" type="text/css" />
</asp:Content>


<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper">
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
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 class="font-weight-bold mb-0">Admin Dashboard</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title text-md-center text-xl-left">Total Gross Merchandise Volume</p>
                                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">8888</h3>
                                        <i class="ti-shopping-cart icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                    </div>
                                    <p class="mb-0 mt-2 text-success">0.12% <span class="text-black ms-1"><small>(30 days)</small></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title text-md-center text-xl-left">Total Product Sold (RM)</p>
                                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">5123</h3>
                                        <i class="ti-money icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                    </div>
                                    <p class="mb-0 mt-2 text-success">0.47% <span class="text-black ms-1"><small>(30 days)</small></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title text-md-center text-xl-left">Total Product Listed</p>
                                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">50</h3>
                                        <i class="ti-server icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                    </div>
                                    <p class="mb-0 mt-2 text-success">+ 1 Product <span class="text-black ms-1"><small>(30 days)</small></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title text-md-center text-xl-left">Total number of Existing User</p>
                                    <div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
                                        <h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">200</h3>
                                        <i class="ti-user icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
                                    </div>
                                    <p class="mb-0 mt-2 text-success">+ 20 Users <span class="text-black ms-1"><small>(30 days)</small></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Product Categories</h4>
                                    <canvas id="doughnutChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Categories Popularity</h4>
                                    <canvas id="pieChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title mb-0">Products Listing Preview</p>
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Product ID</th>
                                                    <th>Product Name</th>
                                                    <th>Price (RM)</th>
                                                    <th>Quantity</th>

                                                </tr>
                                            </thead>
<%--                                            <tbody>
                                                <asp:Repeater ID="AdminDashboardRepeater" runat="server">
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
                                                            </tbody>--%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card position-relative">
                                <div class="card-body">
                                    <p class="card-title">Detailed Reports</p>
                                    <div class="row">
                                        <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-center">
                                            <div class="ml-xl-4">
                                                <h1>500</h1>
                                                <h3 class="font-weight-light mb-xl-4">Sales</h3>
                                                <p class="text-muted mb-2 mb-xl-0">The total number of sessions within the date range in 2024. It is the period time of the customers' order purchase categories </p>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xl-9">
                                            <div class="row">
                                                <div class="col-md-6 mt-3 col-xl-5">
                                                    <canvas id="north-america-chart"></canvas>
                                                    <div id="north-america-legend"></div>
                                                </div>
                                                <div class="col-md-6 col-xl-7">
                                                    <div class="table-responsive mb-3 mb-md-0">
                                                        <table class="table table-borderless report-table">
                                                            <tr>
                                                                <td class="text-muted">Hat Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">17</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Eletronice Devices Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">5</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Shoes Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">23</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Snacks Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">10</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Others</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">8</h5>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                                            </div>
                <!-- content-wrapper ends -->
                                                            </div>
            <!-- main-panel ends -->
                                                            </div>
        <!-- page-body-wrapper ends -->
                                                            </div>
    <!-- container-scroller -->

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
                                                            <script src="/Scripts/App/Admin/dashboard.js"></script>
                                                            <script src="/Scripts/App/Admin/chart.js"></script>
                                                            <!-- End custom js for this page-->
</asp:Content>
