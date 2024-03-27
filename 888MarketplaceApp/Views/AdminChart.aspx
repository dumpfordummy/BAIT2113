<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminChart.aspx.cs" Inherits="_888MarketplaceApp.Views.AdminChart" %>

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
                        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                            <i class="ti-palette menu-icon"></i>
                            <span class="menu-title">UI Elements</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="ui-basic">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="../../pages/ui-features/buttons.html">Buttons</a></li>
                                <li class="nav-item"><a class="nav-link" href="../../pages/ui-features/typography.html">Typography</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../pages/forms/basic_elements.html">
                            <i class="ti-layout-list-post menu-icon"></i>
                            <span class="menu-title">Form elements</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AdminChart.aspx">
                            <i class="ti-pie-chart menu-icon"></i>
                            <span class="menu-title">Charts</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../pages/tables/basic-table.html">
                            <i class="ti-view-list-alt menu-icon"></i>
                            <span class="menu-title">Tables</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../pages/icons/themify.html">
                            <i class="ti-star menu-icon"></i>
                            <span class="menu-title">Icons</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                            <i class="ti-user menu-icon"></i>
                            <span class="menu-title">User Pages</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="auth">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="../../pages/samples/login.html">Login </a></li>
                                <li class="nav-item"><a class="nav-link" href="../../pages/samples/login-2.html">Login 2 </a></li>
                                <li class="nav-item"><a class="nav-link" href="../../pages/samples/register.html">Register </a></li>
                                <li class="nav-item"><a class="nav-link" href="../../pages/samples/register-2.html">Register 2 </a></li>
                                <li class="nav-item"><a class="nav-link" href="../../pages/samples/lock-screen.html">Lockscreen </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../documentation/documentation.html">
                            <i class="ti-write menu-icon"></i>
                            <span class="menu-title">Documentation</span>
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
                                    <button type="button" class="btn btn-primary btn-icon-text btn-rounded" onclick="window.print()">
                                        <i class="ti-clipboard btn-icon-prepend"></i>Print
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Line chart</h4>
                                        <canvas id="lineChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Bar chart</h4>
                                        <canvas id="barChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Area chart</h4>
                                        <canvas id="areaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Doughnut chart</h4>
                                        <canvas id="doughnutChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Pie chart</h4>
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin grid-margin-lg-0 stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Scatter chart</h4>
                                        <canvas id="scatterChart"></canvas>
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
</asp:Content>
