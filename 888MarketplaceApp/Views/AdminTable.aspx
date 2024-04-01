<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminTable.aspx.cs" Inherits="_888MarketplaceApp.AdminTable" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="adminTemporaryPlaceholder">
    <link rel="stylesheet" href="/Content/css/adminTemp.css" type="text/css" />
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
                    <li class="nav-item">
                        <a class="nav-link" href="Account.aspx">
                            <i class="ti-user menu-icon"></i>
                            <span class="menu-title">Profile</span>
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
                                    <h3 class="font-weight-bold mb-0">Product Listing Table</h3>

                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Product ID</th>
                                                    <th>Product</th>
                                                    <th>Sale</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>P1000</td>
                                                    <td>Photoshop</td>
                                                    <td class="text-danger">28.76% <i class="ti-arrow-down"></i></td>
                                                    <td>
                                                        <label class="badge badge-danger">Pending</label></td>
                                                </tr>
                                                <tr>
                                                    <td>P1001</td>
                                                    <td>Flash</td>
                                                    <td class="text-danger">21.06% <i class="ti-arrow-down"></i></td>
                                                    <td>
                                                        <label class="badge badge-warning">In progress</label></td>
                                                </tr>
                                                <tr>
                                                    <td>P1002</td>
                                                    <td>Premier</td>
                                                    <td class="text-danger">35.00% <i class="ti-arrow-down"></i></td>
                                                    <td>
                                                        <label class="badge badge-info">Fixed</label></td>
                                                </tr>
                                                <tr>
                                                    <td>P1003</td>
                                                    <td>After effects</td>
                                                    <td class="text-success">82.00% <i class="ti-arrow-up"></i></td>
                                                    <td>
                                                        <label class="badge badge-success">Completed</label></td>
                                                </tr>
                                                <tr>
                                                    <td>P1004</td>
                                                    <td>53275535</td>
                                                    <td class="text-success">98.05% <i class="ti-arrow-up"></i></td>
                                                    <td>
                                                        <label class="badge badge-warning">In progress</label></td>
                                                </tr>
                                            </tbody>
                                        </table>
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
