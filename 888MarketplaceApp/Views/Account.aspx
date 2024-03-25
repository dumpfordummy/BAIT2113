<%@ Page Language="C#" MasterPageFile="~/Views/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="_888MarketplaceApp.Views.Account" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="homeBody">
    <div class="container-scroller">
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="ti-user menu-icon"></i>
                        <span class="menu-title">My Account</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="auth">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">Change Password</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="ti-view-list-alt menu-icon"></i>
                        <span class="menu-title">My Purchase</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</asp:Content>
