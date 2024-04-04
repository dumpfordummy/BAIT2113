<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="_888MarketplaceApp.Views.AdminDashboard" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="adminTemporaryPlaceholder">
    <link rel="stylesheet" href="/Content/css/adminTemp2.css" type="text/css" />
</asp:Content>


<asp:Content runat="server" ID="bodyCT" ContentPlaceHolderID="bodyContent">
    <div class="container-scroller">
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_sidebar.html -->
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
                        <div class="col-md-12 grid-margin">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 class="font-weight-bold mb-0">Admin Dashboard</h4>
                                </div>
                                <div>
                                    <button type="button" class="btn btn-primary btn-icon-text btn-rounded">
                                        <i class="ti-clipboard btn-icon-prepend"></i>Report
                                    </button>
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
                                        <i class="ti-server icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
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
                                    <h4 class="card-title">Doughnut chart</h4>
                                    <canvas id="doughnutChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card border-bottom-0">
                                <div class="card-body pb-0">
                                    <p class="card-title">Purchases</p>
                                    <p class="text-muted font-weight-light">The argument in favor of using filler text goes something like this: If you use real content in the design process, anytime you reach a review</p>
                                    <div class="d-flex flex-wrap mb-5">
                                        <div class="me-5 mt-3">
                                            <p class="text-muted">Status</p>
                                            <h3>362</h3>
                                        </div>
                                        <div class="me-5 mt-3">
                                            <p class="text-muted">New users</p>
                                            <h3>187</h3>
                                        </div>
                                        <div class="me-5 mt-3">
                                            <p class="text-muted">Chats</p>
                                            <h3>524</h3>
                                        </div>
                                        <div class="mt-3">
                                            <p class="text-muted">Feedbacks</p>
                                            <h3>509</h3>
                                        </div>
                                    </div>
                                </div>
                                <canvas id="order-chart" class="w-100"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <p class="card-title mb-0">Top Products</p>
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
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>P1000</td>
                                                    <td>Twisties Cheddar Cheese 60g</td>
                                                    <td>5.00</td>
                                                    <td>10</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>P1001</td>
                                                    <td>Nike AirForce</td>
                                                    <td>305.00</td>
                                                    <td>2</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>P1002</td>
                                                    <td>Team Victor T-Shirt (Black)</td>
                                                    <td>50.00</td>
                                                    <td>1</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>P1003</td>
                                                    <td>Apple Watch Series 9 Aluminium Case with Sport Band GPS Only</td>
                                                    <td>1898.00 </td>
                                                    <td>20</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>P1004</td>
                                                    <td>NEW ERA MLB NY New York Yankees Baseball Cap</td>
                                                    <td>80.00 </td>
                                                    <td>12</td>
                                                </tr>
                                            </tbody>
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
                                                <h1>33500</h1>
                                                <h3 class="font-weight-light mb-xl-4">Sales</h3>
                                                <p class="text-muted mb-2 mb-xl-0">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>
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
                                                                <td class="text-muted">Meat Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">524</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Sea Food Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">722</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Vegetable Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">173</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Fruits Product</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">945</h5>
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
                                                                    <h5 class="font-weight-bold mb-0">553</h5>
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

                <!-- partial -->
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
