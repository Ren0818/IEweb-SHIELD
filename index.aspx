<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
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
                        <li class="active">
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
           <header id="head">
            <div class="container">
                <div class="row">
                    <h1 class="lead">Find a safer place with Shield.</h1>
                    <p class="tagline">We care about child safety
                    <p>
                        <a class="btn btn-default btn-lg" role="button" href="ourHis.aspx">MORE INFO</a>
                        <a class="btn btn-action btn-lg" role="button" href="signup.aspx">Join Now!</a>
                    </p>
                </div>
            </div>
        </header>
    	<!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h2 class="thin">It is very important to know the child safety factors.</h2>
		<p class="text-muted">
			Do you know how safe your neighbourhood is?
		</p>
	</div>
	<!-- /Intro-->
    <!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h3 class="text-center thin">How many factors are defined by our website?</h3>
			
			<div class="row">
				<div class="col-md-3 col-sm-6 highlight"> 
					<div class="h-caption"><h4><i class="fa fa-cogs fa-5"></i>Child abuse</h4></div>
					<div class="h-body text-center">
						<p>Child abuse is an act by parents or caregivers which endangers a child or young person's physical or emotional health or development.
Shield gives information about the proportion of children and young people (0-17 years old) who report being abused.
 </p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 highlight">
					<div class="h-caption"><h4><i class="fa fa-flash fa-5"></i>Bullying</h4></div>
					<div class="h-body text-center">
						<p>Child Bullying is repeated and aggressive verbal, physical, social or psychological behaviour that is harmful and involves the misuse of power by an individual or group towards a child.
Shield gives information about the proportion of children (6-9 years old) who report being bullied.
 </p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 highlight">
					<div class="h-caption"><h4><i class="fa fa-heart fa-5"></i>Crime on young</h4></div>
					<div class="h-body text-center">
						<p>Crime on young is an act of crime where the victim was a child or young person.
Shield gives information about the proportion of children and young people (0-17 years old) who report being the crime victim.
</p>

					</div>
				</div>
				<div class="col-md-3 col-sm-6 highlight">
					<div class="h-caption"><h4><i class="fa fa-smile-o fa-5"></i>Not Vaccinated</h4></div>
					<div class="h-body text-center">
                        <p>Child Vaccination is the term used for the process of both getting the vaccine and becoming immune to the disease as a result of the vaccine.
Shield gives information about the proportion of children (1-6 years old) who are fully vaccinated.
</p>
						

					</div>
				</div>
			</div> <!-- /row  -->
		
		</div>
	</div>
    <!-- /Highlights -->
    <!-- container -->
	<div class="container">

		<h2 class="text-center top-space">Frequently Asked Questions</h2>
		<br>

	
			<div class="col-sm-6">
				<h3>How can I use the search function?</h3>
				<p>I'd highly recommend you <a href="signup.aspx">to register</a> for membership, its free! In addition, there are many existing functions for you!</p>
		
		
		</div> <!-- /row -->

			<div class="col-sm-6">
				<h3>Are there any other topic besides from child safety here?</h3>
				<p>
					 Firstly, our website's main topic is about child safety, but that does not mean that we will only focusing on this area, our target is to provide user a 
                    integrated information about their neighbourhood.
				</p>
		
			
		</div> <!-- /row -->

		

</div>	
</asp:Content>

