<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <a href="index.aspx">Home</a>

                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="search.aspx">Search</a>

                            </li>
                            <li>
                                <a href="top10.aspx">Top 10</a>
                            </li>
                            <li>
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li >
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                    <li >
                            <a href="forum.aspx">Discuss</a>
                        </li>
                        <li >
                                <a href="ourHis.aspx" class="dropdown active">About Us</a>
                    </li>
                    <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
                    <li>
                            <a href="<%=URL%>">
                                <asp:Label runat="server" id="UserSigned" Text="SIGN IN / SIGN UP" class="btn-sm btn-info" ></asp:Label>

                            </a>
                        </li>
                  
                       
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <header id="head" class="secondary"></header>
    <div class="container">

        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Sign in</li>
        </ol>

        <div class="row">

            <!-- Article main content -->
            <article class="col-xs-12 maincontent">
                <header class="page-header">
                    
                    <h1 class="page-title">Sign in</h1>
                </header>

                <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3 class="thin text-center">Sign in to your account</h3>
                            <p class="text-center text-muted">If you are not a membership, click <a href="signup.aspx">Register</a> and start your free membership now! </p>
                            <hr>


                            <div class="top-margin">
                                <label>Username<span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Username is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="TextBoxUserName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="top-margin">
                                <label>Password<span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                            </div>

                            <hr>

                            <div class="row">
                                <div class="col-lg-8">
                                    <b><a href="notimp.aspx">Forgot password?</a>
                                </div>
                                <div class="col-lg-4 text-right">
                                    <asp:Button ID="Button_login" runat="server" OnClick="Button_login_Click" Text="Sign in" CssClass="btn btn-action" />
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </article>
            <!-- /Article -->

        </div>
    </div>
    <!-- /container -->
    </a></b></span>
</asp:Content>

