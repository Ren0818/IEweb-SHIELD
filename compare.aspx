<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="compare.aspx.cs" Inherits="compare"%>

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
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="top10.aspx">Top 10</a>
                            </li>
                            <li >
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li class="active">
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/headroom.min.js"></script>
    <script src="assets/js/jQuery.headroom.min.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>
        
    <header id="head" class="secondary"></header>
    <div class="container" style="background-color:white">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Compare </li>
        </ol>
            <div class="row">
                <div class="col-md-6">
                    <img src="assets\images\1.jpg" class="center-block img-responsive img-rounded">
                </div>
                <div class="col-md-6">
                    <h1 class="text-left">Compare Function</h1>
                    <h3></h3>
                    <p class="text-justify">
                        
The compare function is using rate measure. Rate is a proportion measure based on the different safety factor. This measure is calculated from the number of reported children divided by a total number of surveyed children in the particular area.

                    </p>

                </div>

            </div>

            <div class="section">

                <div class="container">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                      <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>  
                                 <div class="col-md-12">
                                          <h3 class="thin text-center">Compare</h3>
                                        <p class="text-center text-muted">Before use this function, make sure you have read <a href="terms.aspx">Terms & Condition, and Disclaimer</a>. If you need any help, click <a href="Contact.aspx">Help</a>. </p>
                                        <hr>
                                     </div>
                    <div class="row">
                         <div class="col-md-3" style="background-color: white">

                                <div class="col-md-12">

                                    <div class="panel-body">
                                       
                                        <form>
                                            <div class="top-margin">
                                                City <label style="color:navy">Blue</label><br />
                                                <asp:DropDownList ID="city1" runat="server" class="form-control">
                                                 </asp:DropDownList>
                                            </div>
                                            <div class="top-margin">
                                               City <label style="color:orange"> Orange</label><br />
                                                <asp:DropDownList ID="city2" runat="server" class="form-control">
                                                 </asp:DropDownList>
                                            </div>
                                            <div class="top-margin">
                                                <div id="div_chk1" runat="server">
                           
                              
                                                    <div id="div_chk" runat="server">
                                            <asp:CheckBox ID="cpf1" runat="server" text="&nbsp;Not Vaccinated"/>
                                            <br />
                                            <asp:CheckBox ID="cpf2" runat="server" Text="&nbsp;Bullying" />
                                            <br />
                                            <asp:CheckBox ID="cpf3" runat="server" Text="&nbsp;Crime on Young" />
                                            <br />
                                            <asp:CheckBox ID="cpf4" runat="server" Text="&nbsp;Child Abuse" />
                                                <br />
                                        </div>
                                            </div>
                                                </div>
                                            <div class="row top-margin">
                                                <div class="col-sm-6">
                                                    <asp:Button ID="compare_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="compare_btn_Click" />
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
                                    
                            <div class="col-md-12" style="background-color:white">
                                <asp:Panel ID="Panel1" runat="server" Visible="false">
                                 <div class="col-md-6" style="background-color:white">
                            <!--Vacc chart -->
                                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                   <div class="post" runat="server" id="Div1" visible="True" >
                                        <asp:Chart ID="ChartVacc" runat="server" 
      BackGradientStyle="TopBottom" BorderWidth="2px" BackColor="White"
       Visible="False">
                                            
                                            <Titles>
                                                 <asp:Title Font="Consolas, 14.25pt" Name="Title1"
                                                     Text="Not Vaccinated">
                                                 </asp:Title>
                                    </Titles>
                                             <Series>
                                        <asp:Series Name="City1"></asp:Series>
                                        <asp:Series Name="City2"></asp:Series>

                                    </Series>
                                             <ChartAreas>
                                        <asp:ChartArea Name="ChartAreaVacc" BackColor="Transparent">
                                            <AxisX Title="Year"></AxisX>
                                            <AxisY Title="Rate" ></AxisY>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                         </asp:Chart>
                                        </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                            </div>
                                </asp:Panel>
                                <asp:Panel ID="Panel2" runat="server" Visible="false">
                                <div class="col-md-6" style="background-color:white">
                            <!--Bully chart -->
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                            <div class="post" runat="server" id="Div2" visible="True">
                                <asp:Chart ID="ChartBully" runat="server" BackColor="white" Visible="False" BackGradientStyle="TopBottom" BorderWidth="2px" >
                                    <Titles>
                                        <asp:Title Font="Consolas, 14.25pt" Name="Title1"
                                            Text="Bullying">
                                        </asp:Title>
                                    </Titles>
                                    <Series>
                                        <asp:Series Name="City1"></asp:Series>
                                        <asp:Series Name="City2"></asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartAreaBully" BackColor="Transparent">
                                            <AxisX Title="Year"></AxisX>
                                            <AxisY Title="Rate"></AxisY>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                                </ContentTemplate>
                                        </asp:UpdatePanel>
                        </div>
                                    </asp:Panel>
                            </div>
                        <div class="col-md-12" style="background-color:white">
                             <asp:Panel ID="Panel3" runat="server" Visible="false">
                        <div class="col-md-6" style="background-color:white">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                            <!--Crime chart -->
                            <div class="post" runat="server" id="Div3" visible="True">
                                <asp:Chart ID="ChartCrime" runat="server" BackGradientStyle="TopBottom" BorderWidth="2px" BackColor="White" Visible="False">
                                    <Titles>
                                        <asp:Title Font="Consolas, 14.25pt" Name="Title1"
                                            Text="Crime on young">
                                        </asp:Title>
                                    </Titles>
                                    <Series>
                                        <asp:Series Name="City1"></asp:Series>
                                        <asp:Series Name="City2"></asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartAreaCrime" BackColor="Transparent">
                                            <AxisX Title="Year"></AxisX>
                                            <AxisY Title="Rate"></AxisY>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                        </div>
                                 </asp:Panel>
                             <asp:Panel ID="Panel4" runat="server" Visible="false">
                        <div class="col-md-6" style="background-color:white">
                            <!--Abuse chart -->
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                            <div class="post" runat="server" id="Div4" visible="True">
                                <asp:Chart ID="ChartAbuse" runat="server" BackGradientStyle="TopBottom" BorderWidth="2px" BackColor="White" Visible="False">
                                    <Titles>
                                        <asp:Title Font="Consolas, 14.25pt" Name="Title1"
                                            Text="Child Abuse">
                                        </asp:Title>
                                    </Titles>
                                    <Series>
                                        <asp:Series Name="City1"></asp:Series>
                                        <asp:Series Name="City2"></asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartAreaAbuse" BackColor="Transparent">
                                            <AxisX Title="Year"></AxisX>
                                            <AxisY Title="Rate"></AxisY>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                          
                        </div>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                    </div>
                                 </asp:Panel>
                         </div>
                    </div>
                            
                       

                    </div>
                                </ContentTemplate>
                          </asp:UpdatePanel>
                </div>
                </div>
</asp:Content>

