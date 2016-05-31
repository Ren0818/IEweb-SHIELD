<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>
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
                    <img src="assets/images/logo.png" alt=""></img>
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <a href="index.aspx">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li >
                                <a href="search.aspx">Search</a>
                            </li>
                            <li class="active">
                                <a href="top10.aspx">Top 10</a>
                            </li>
                            <li>
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li>
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
                    <li class="active">
                        <a href="contact.aspx" >Contact</a>
                    </li>
                  <li>
                            <a href="<%=URL%>">
                                <asp:Label runat="server" id="UserSigned" Text="SIGN IN / SIGN UP" class="btn-sm btn-info" ></asp:Label>

                            </a>
                        </li>
                          <li>
                             <a href="<%=URL1%>">
                                <asp:Label runat="server" id="user" class="btn-sm btn-success" Visible="False"/>

                            </a>
                        </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/headroom.min.js"></script>
    <script src="assets/js/jQuery.headroom.min.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>

    <header id="head" class="secondary"></header>
    <div class="container" >
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Contact Us </li>
        </ol>
        <div class="col-md-2"></div>
<div class="col-md-8">
    <div class="form-area">  
        <form role="form">
        <br style="clear:both">
      
                    <h3 style="margin-bottom: 25px; text-align: center;">Contact Form</h3>
    				<div class="form-group">
                        Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a name!" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
					    <asp:TextBox ID="name" runat="server" class="form-control"></asp:TextBox>
					</div>
					<div class="form-group">
						 Email<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="We need to contact you!" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
					     <asp:TextBox ID="email" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
					</div>
					<div class="form-group">
						 Phone Number
                        <asp:TextBox ID="mnum" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
					</div>
                    <div class="form-group">
                   Message<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Please describe your situation!" ControlToValidate="mag"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="mag" runat="server" class="form-control" TextMode="MultiLine" Height="200px"></asp:TextBox>
                                           
                    </div>
            <asp:Button ID="Button1" runat="server" Text="Submit Form" class="btn btn-success pull-right" OnClick="Button1_Click" />
            
        </form>
    </div>
</div>
        <div class="col-md-2"></div>
</div>
    <style type="text/css">
        .red{
    color:red;
    }
.form-area
{
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
	}
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#characterLeft').text('140 characters left');
            $('#message').keydown(function () {
                var max = 140;
                var len = $(this).val().length;
                if (len >= max) {
                    $('#characterLeft').text('You have reached the limit');
                    $('#characterLeft').addClass('red');
                    $('#btnSubmit').addClass('disabled');
                }
                else {
                    var ch = max - len;
                    $('#characterLeft').text(ch + ' characters left');
                    $('#btnSubmit').removeClass('disabled');
                    $('#characterLeft').removeClass('red');
                }
            });
        });
    </script>
</asp:Content>

