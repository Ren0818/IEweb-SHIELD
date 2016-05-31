<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="notimp.aspx.cs" Inherits="notimp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    
    <div class="navbar navbar-inverse navbar-fixed-top headroom">
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.aspx">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                &nbsp;</div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right">
                        <li >
                            <a href="index.aspx">Home</a>
                        </li>
                       <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="top10.aspx">Top10</a>
                            </li>
                            <li>
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li>
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">About Us<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="ourhis.aspx">Our History</a>
                                </li>
                                <li>
                                    <a href="notimp.aspx" class="active">FAQs</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="notimp.aspx">Contact</a>
                        </li>
                        <li><a href="signin.aspx">
                            
                            <asp:Label ID="UserSigned" runat="server" Text="SIGN IN / SIGN UP" class="btn-sm   btn-info" ></asp:Label>
                            </a>
                        </li>

                          <li>
                              <a href="notimp.aspx">
                              <asp:Label ID="user" runat="server" Text="Log out" class="btn-sm btn-success" Visible="False"/>
                            </a>
                        </li>
				</ul>     
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
    <header id="head" class="secondary"></header>
    <p>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/images/notimp.jpg"/>
   </p>
</asp:Content>

