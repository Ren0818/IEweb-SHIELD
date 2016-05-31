<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="title" Runat="Server">
    <div class="navbar navbar-inverse navbar-fixed-top headroom" runat="server">
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
                &nbsp;&nbsp;&nbsp;</div>
                <div class="navbar-collapse collapse" runat="server">
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
                        <li>
                            <a href="Contact.aspx">Contact</a>
                        </li>
                     
                            
				</ul>     
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
</asp:Content>
<asp:content id="Content1" contentplaceholderid="ContentBody" runat="Server">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
    <header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.aspx">Home</a></li>
			<li class="active">Registration</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Registration</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Register a new account</h3>
							<p class="text-center text-muted">If you already have an account, <a href="signin.aspx">Login</a> please. Free registration no trap. </p>
							<hr>
                            	<form>
								<div class="top-margin">
									<label>User Name<span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Username is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="TextBoxUN" runat="server" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Invalid username. Should be 4-12 digital with letters, numbers and &quot;_&quot;, also can not start or end with &quot;-&quot;. " ForeColor="Red" ValidationExpression="/^[a-zA-Z\d]\w{3,11}[a-zA-Z\d]$/" Visible="False"></asp:RegularExpressionValidator>
								</div>
								<div class="top-margin">
									<label>Email <span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEM" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="TextBoxEM" runat="server" class="form-control" TextMode="Email"></asp:TextBox>
								    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxEM" ErrorMessage="Invalid Email." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
								    <br />
								</div>
								<div class="top-margin">
									<label>Gander<span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownListGender" ErrorMessage="Gender is required." ForeColor="Red" InitialValue="Select gender"></asp:RequiredFieldValidator>
                                &nbsp;<asp:DropDownList ID="DropDownListGender" runat="server" class="form-control" Width="218px">
                                       <asp:ListItem>Select gender</asp:ListItem>
                                       <asp:ListItem>Male</asp:ListItem>
                                       <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
								</div>
								<div class="top-margin">
									
										<label>Password<span class="text-danger">*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="TextBoxPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
									    
									    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Informat password. Should be 6-18 digital with letters, numbers and &quot;-&quot;, also start with a letter." ForeColor="Red" ValidationExpression="^[a-zA-Z]\w{5,17}$"></asp:RegularExpressionValidator>
	    
									</div>
                                    <div class="top-margin">
	
										<label>Confirm Password<span class="text-danger">*</span></la*</span></label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxCP" ErrorMessage="Please re-enter the password." ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="TextBoxCP" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
									    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxCP" ErrorMessage="Both password should be same." ForeColor="Red"></asp:CompareValidator>
									
								</div>
								<hr>
								<div class="row">
									<div class="col-lg-8">
										<label class="checkbox">
											<asp:CheckBox ID="readterms" runat="server" Checked="True"  /> 
											I've read the <a href="terms.aspx">Terms and Conditions                      
														<div class="col-lg-4 text-right">
                                        <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-action" OnClick="Button1_Click"/>
                                        
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>	
			</article>
			<!-- /Article -->
		</div>
	</div>	<!-- /container -->
    <!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
    </a>
    </label>
</asp:content>

