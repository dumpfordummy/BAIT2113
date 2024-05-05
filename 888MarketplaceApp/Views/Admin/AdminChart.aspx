<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminChart.aspx.cs" Inherits="_888MarketplaceApp.Views.AdminChart" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="adminTemporaryPlaceholder">
    <link rel="stylesheet" href="/Content/css/adminTemp2.css" type="text/css" />
</asp:Content>

<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">

        <!-- partial -->
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
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="HeaderRow">
                        <div class="col-md-12 grid-margin">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 class="font-weight-bold mb-0">Chart Sales Report</h4>
                                </div>
                                <div>
                                    <button type="button" class="btn btnGreen btn-icon-text btn-rounded">
                                        <i class="ti-printer btn-icon-prepend"></i>Print
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Profit Analytics chart</h4>
                                        <canvas id="lineChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Gender Distribution of Customers</h4>
                                        <canvas id="barChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Product Categories</h4>
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Categories Popularity</h4>
                                        <canvas id="doughnutChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->

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
    </div>
</asp:Content>
