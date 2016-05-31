<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

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
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="active">
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
                    <li>
                        <a href="forum.aspx">Discuss</a>
                    </li>
                    <li>
                        <a href="ourHis.aspx" class="dropdown active">About Us</a>
                    </li>
                    <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
                    <li>
                        <a href="<%=URL%>">
                            <asp:Label runat="server" id="UserSigned" Text="SIGN IN / SIGN UP" class="btn-sm btn-info"></asp:Label>

                        </a>
                    </li>
                    <li>
                        <a href="<%=URL1%>">
                            <asp:Label runat="server" id="user" class="btn-sm btn-success" Visible="False" />

                        </a>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/headroom.min.js"></script>
    <script src="assets/js/jQuery.headroom.min.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>

    <header id="head" class="secondary"></header>
    <div class="container" style="background-color: white">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Search </li>
        </ol>


        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>


        <div class="row">
            <div class="col-md-6">
                <img src="assets\images\mac.jpg" class="center-block img-responsive img-rounded">
            </div>
            <div class="col-md-6">
                <h1 class="text-left">Search function</h1>

                <p class="text-justify">
                    This website is using open data from Victoria.<br />
                    Government about immunisation rate, bullying rate, crime on young proportion, and child abuse rate. The data came from surveys about those factors conducted in Victoria from 2009 to 2012 .
Safety factors: vaccination,  bullying, crime on young, and child abuse.<br />
                    <b>Number</b>: the number of reported children regarding certain safety factors in areas of Victoria. For example number of reporting children who are vaccinated in Monash.<br />
                    <b>Total number</b>:  the total number of surveyed children in particular parts of Victoria regarding different safety factors.<br />
                    <b>Rate</b>: a proportion measure based on the different safety factor. This measure is calculated from the number of reported children divided by a total number of surveyed children in the particular area.<br />
                    
                </p>
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                         <h3 class="thin text-center">Find a place</h3>
                                <p class="text-center text-muted">Before use this fucntion, make sure you have read <a href="terms.aspx">Terms & Condition, and Disclaimer</a>. If you need any help, click <a href="Contact.aspx">Help</a>. </p>
                                <hr>
                    </div>
                    <div class="col-md-3" style="background-color: white">
                        <div class="col-md-12">
                            <div class="panel-body">
                               
                                <form>
                                    <div class="top-margin">
                                        <h4>
                                            <label>City Name</label></h4>
                                        <asp:DropDownList ID="suburb" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="top-margin">
                                        <h4>
                                            <label>Factors</label><br />
                                        </h4>

                                        <div id="div_chk" runat="server">
                                            <a href="#"><asp:CheckBox ID="factor1" runat="server" Text="&nbsp;Not Vaccinated" /></a>
                                            <br />
                                             <a href="#"><asp:CheckBox ID="factor2" runat="server" Text="&nbsp;Bullying" /></a>
                                            <br />
                                             <a href="#"><asp:CheckBox ID="factor3" runat="server" Text="&nbsp;Crime on Young" /></a>
                                            <br />
                                             <a href="#"><asp:CheckBox ID="factor4" runat="server" Text="&nbsp;Child Abuse" /></a>
                                            <br />
                                        </div>
                                    </div>
                                    <div class="top-margin">
                                        <label>Year<span class="text-danger">*</span></label>
                                        <asp:DropDownList ID="year" runat="server" class="form-control">
                                            <asp:ListItem>2012</asp:ListItem>
                                            <asp:ListItem>2011</asp:ListItem>
                                            <asp:ListItem>2010</asp:ListItem>
                                            <asp:ListItem>2009</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="row top-margin">
                                        <div class="col-sm-6">
                                            <asp:Button ID="search1" runat="server" Text="Search" CssClass="btn btn-info" OnClick="Search_Click" />
                                        </div>
                                        <div class="col-sm-6">
                                        </div>
                                    </div>
                                    <hr />
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">

                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>

                                <div class="row">
                                    <asp:Panel ID="search_panel" runat="server" Visible="false">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">

                                                    <asp:Label ID="cityName2" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="col-md-7">
                                                        <asp:Label ID="cityInfo" runat="server" Text="Label"></asp:Label>

                                                        <br />
                                                        <asp:Label ID="cityInfo0" runat="server"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="cityInfo1" runat="server"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="cityInfo2" runat="server"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="cityInfo3" runat="server"></asp:Label>

                                                    </div>
                                                    <div class="col-md-5">
                                                        <asp:Button ID="chart" runat="server" Text="chart" CssClass="btn btn-info" OnClick="chart_Click" />
                                                        <asp:Button ID="table" runat="server" Text="table" CssClass="btn btn-info" OnClick="Search_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:Chart ID="Chart1" runat="server" Width="900px" Palette="Bright">
                                            <Series>
                                                <asp:Series Name="Not Vaccinated" ChartType="Line"></asp:Series>
                                                <asp:Series Name="Bullying" ChartType="Line"></asp:Series>
                                                <asp:Series Name="Crime on young" ChartType="Line"></asp:Series>
                                                <asp:Series Name="Child abuse" ChartType="Line"></asp:Series>
                                            </Series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1">
                                                    <AxisX Title="Year"></AxisX>
                                                    <AxisY Title="Rate"></AxisY>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>

                                    </div>
                                    <div class="col-md-4">
                                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/images/chartdes.jpg" Visible="false" />
                                        </asp:Panel>
                                    </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="search1" EventName="Click" />
                            </Triggers>

                        </asp:UpdatePanel>

                    </div>
                </div>

            </div>

        </div>


    </div>

    </div>
 <style type="text/css">
     .bbb {
         color: #e84630;
     }
 </style>

</asp:Content>

