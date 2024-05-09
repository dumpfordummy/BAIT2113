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
                                        <h4 class="card-title">Distribution of Shipping Methods</h4>
                                        <canvas id="barChartShippingMethod"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Distribution of Payment Methods</h4>
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
        <script type="text/javascript">
            $(function () {
                /* ChartJS
                 * -------
                 * Data and config for chartjs
                 */
                'use strict';
                var data = {
                    labels: ["2020", "2021", "2022", "2023", "2024"],
                    datasets: [{
                        label: '# of Votes',
                        data: [10, 19, 3, 5, 2, 3],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1,
                        fill: false
                    }]
                };

                var bardata = {
                    labels: paymentMethod,
                    datasets: [{
                        label: '# of Votes',
                        data: paymentMethodCount,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',

                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                        ],
                        borderWidth: 1,
                        fill: false
                    }]
                };

                var bardataShippingMethod = {
                    labels: shippingMethod,
                    datasets: [{
                        label: '# of Votes',
                        data: shippingMethodCount,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',

                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                        ],
                        borderWidth: 1,
                        fill: false
                    }]
                };

                var multiLineData = {
                    labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                    datasets: [{
                        label: 'Dataset 1',
                        data: [12, 19, 3, 5, 2, 3],
                        borderColor: [
                            '#587ce4'
                        ],
                        borderWidth: 2,
                        fill: false
                    },
                    {
                        label: 'Dataset 2',
                        data: [5, 23, 7, 12, 42, 23],
                        borderColor: [
                            '#ede190'
                        ],
                        borderWidth: 2,
                        fill: false
                    },
                    {
                        label: 'Dataset 3',
                        data: [15, 10, 21, 32, 12, 33],
                        borderColor: [
                            '#f44252'
                        ],
                        borderWidth: 2,
                        fill: false
                    }
                    ]
                };
                var options = {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                    legend: {
                        display: false
                    },
                    elements: {
                        point: {
                            radius: 0
                        }
                    }

                };
                var doughnutPieData = {
                    datasets: [{
                        data: productCount,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                    }],

                    // These labels appear in the legend and in the tooltips when hovering different arcs
                    labels: productCategories
                };

                var PieData = {
                    datasets: [{
                        data: popularityCount,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                            'rgba(255, 159, 64, 0.5)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                    }],

                    // These labels appear in the legend and in the tooltips when hovering different arcs
                    labels: productCategories
                };

                var doughnutPieOptions = {
                    responsive: true,
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    }
                };


                var areaOptions = {
                    plugins: {
                        filler: {
                            propagate: true
                        }
                    }
                }

                var multiAreaData = {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                        label: 'Facebook',
                        data: [8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14],
                        borderColor: ['rgba(255, 99, 132, 0.5)'],
                        backgroundColor: ['rgba(255, 99, 132, 0.5)'],
                        borderWidth: 1,
                        fill: true
                    },
                    {
                        label: 'Twitter',
                        data: [7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9],
                        borderColor: ['rgba(54, 162, 235, 0.5)'],
                        backgroundColor: ['rgba(54, 162, 235, 0.5)'],
                        borderWidth: 1,
                        fill: true
                    },
                    {
                        label: 'Linkedin',
                        data: [6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11],
                        borderColor: ['rgba(255, 206, 86, 0.5)'],
                        backgroundColor: ['rgba(255, 206, 86, 0.5)'],
                        borderWidth: 1,
                        fill: true
                    }
                    ]
                };

                var multiAreaOptions = {
                    plugins: {
                        filler: {
                            propagate: true
                        }
                    },
                    elements: {
                        point: {
                            radius: 0
                        }
                    },
                    scales: {
                        xAxes: [{
                            gridLines: {
                                display: false
                            }
                        }],
                        yAxes: [{
                            gridLines: {
                                display: false
                            }
                        }]
                    }
                }

                var scatterChartData = {
                    datasets: [{
                        label: 'First Dataset',
                        data: [{
                            x: -10,
                            y: 0
                        },
                        {
                            x: 0,
                            y: 3
                        },
                        {
                            x: -25,
                            y: 5
                        },
                        {
                            x: 40,
                            y: 5
                        }
                        ],
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)'
                        ],
                        borderWidth: 1
                    },
                    {
                        label: 'Second Dataset',
                        data: [{
                            x: 10,
                            y: 5
                        },
                        {
                            x: 20,
                            y: -30
                        },
                        {
                            x: -25,
                            y: 15
                        },
                        {
                            x: -10,
                            y: 5
                        }
                        ],
                        backgroundColor: [
                            'rgba(54, 162, 235, 0.2)',
                        ],
                        borderColor: [
                            'rgba(54, 162, 235, 1)',
                        ],
                        borderWidth: 1
                    }
                    ]
                }

                var scatterChartOptions = {
                    scales: {
                        xAxes: [{
                            type: 'linear',
                            position: 'bottom'
                        }]
                    }
                }
                // Get context with jQuery - using jQuery's .get() method.
                if ($("#barChart").length) {
                    var barChartCanvas = $("#barChart").get(0).getContext("2d");
                    // This will get the first returned node in the jQuery collection.
                    var barChart = new Chart(barChartCanvas, {
                        type: 'bar',
                        data: bardata,
                        options: options
                    });
                }

                if ($("#barChartShippingMethod").length) {
                    var barChartCanvas = $("#barChartShippingMethod").get(0).getContext("2d");
                    // This will get the first returned node in the jQuery collection.
                    var barChart = new Chart(barChartCanvas, {
                        type: 'bar',
                        data: bardataShippingMethod,
                        options: options
                    });
                }

                if ($("#lineChart").length) {
                    var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
                    var lineChart = new Chart(lineChartCanvas, {
                        type: 'line',
                        data: data,
                        options: options
                    });
                }

                if ($("#linechart-multi").length) {
                    var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
                    var lineChart = new Chart(multiLineCanvas, {
                        type: 'line',
                        data: multiLineData,
                        options: options
                    });
                }

                if ($("#areachart-multi").length) {
                    var multiAreaCanvas = $("#areachart-multi").get(0).getContext("2d");
                    var multiAreaChart = new Chart(multiAreaCanvas, {
                        type: 'line',
                        data: multiAreaData,
                        options: multiAreaOptions
                    });
                }

                if ($("#doughnutChart").length) {
                    var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
                    var doughnutChart = new Chart(doughnutChartCanvas, {
                        type: 'doughnut',
                        data: doughnutPieData,
                        options: doughnutPieOptions
                    });
                }

                if ($("#pieChart").length) {
                    var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
                    var pieChart = new Chart(pieChartCanvas, {
                        type: 'pie',
                        data: PieData,
                        options: doughnutPieOptions
                    });
                }

                if ($("#areaChart").length) {
                    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
                    var areaChart = new Chart(areaChartCanvas, {
                        type: 'line',
                        data: areaData,
                        options: areaOptions
                    });
                }

                if ($("#scatterChart").length) {
                    var scatterChartCanvas = $("#scatterChart").get(0).getContext("2d");
                    var scatterChart = new Chart(scatterChartCanvas, {
                        type: 'scatter',
                        data: scatterChartData,
                        options: scatterChartOptions
                    });
                }

                if ($("#browserTrafficChart").length) {
                    var doughnutChartCanvas = $("#browserTrafficChart").get(0).getContext("2d");
                    var doughnutChart = new Chart(doughnutChartCanvas, {
                        type: 'doughnut',
                        data: browserTrafficData,
                        options: doughnutPieOptions
                    });
                }
            });

        </script>
        <!-- End custom js for this page-->
    </div>
</asp:Content>
