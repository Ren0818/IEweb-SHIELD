<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="top10.aspx.cs" Inherits="_Default" %>

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
                            <li class="active">
                                <a href="search.aspx">Top 10</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/headroom.min.js"></script>
    <script src="assets/js/jQuery.headroom.min.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>

    <header id="head" class="secondary"></header>
    <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <div class="container" style="background-color: white">

        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Top10 </li>
        </ol>
        <div class="row">
            <div class="col-md-6">
                <img src="assets\images\top10.jpg" class="center-block img-responsive img-rounded">
            </div>
            <div class="col-md-6">
                <h1 class="text-left">Top 10 safer place</h1>
                <h3>Ranking</h3>
                <p class="text-justify">
                    
Top 10 function is using effect measure and rate measure. 
                    Rate is a proportion measure based on the different safety factor. This measure is calculated from the number of reported children divided by a total number of surveyed children in the specific area.
The effect is the negative impact of the factors in the safety condition of a particular area. The effect of vaccination is calculated from 100% minus the vaccination rate. While the value of bullying, crime, and abuse effect equals to the value of the rate itself.
The higher vaccination rate, the lower negative impact is. On the other hand, The higher bully, crime, and abuse rate, the greater its adverse effects.


                </p>
            </div>
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="section">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                 <h3 class="thin text-center">TOP 10 ranking</h3>
                                        <p class="text-center text-muted">Before use this function, make sure you have read <a href="terms.aspx">Terms & Condition, and Disclaimer</a>. If you need any help, click <a href="Contact.aspx">Help</a>. </p>
                                        <hr>
                            </div>
                            <div class="col-md-3" style="background-color:white">

                                <div class="col-md-12">
                                    <div class="panel-body">
                                       
                                        <form>
                                            <div class="top-margin">
                                                <h4>
                                                    <label>Factors</label><br />
                                                </h4>
                                                <div id="div1" runat="server">
                                                    <asp:RadioButton ID="tp10f1" runat="server" GroupName="top10rb" Text="&nbsp;Not Vaccinated" />
                                                    <br />
                                                    <asp:RadioButton ID="tp10f2" runat="server" GroupName="top10rb" Text="&nbsp;Bullying" />
                               <br />
                                                    <asp:RadioButton ID="tp10f3" runat="server" GroupName="top10rb" Text="&nbsp;Crime on Young" />
                                             <br />
                                                    <asp:RadioButton ID="tp10f4" runat="server" GroupName="top10rb" Text="&nbsp;Child Abuse" />
                                                    <br />
                                                    <asp:RadioButton ID="tpSA" runat="server" GroupName="top10rb" Text="&nbsp;Select All" ForeColor="#6666FF" />
                                              <br />

                                                </div>
                                            </div>

                                            <div class="row top-margin">
                                                <div class="col-sm-6">
                                                    <asp:Button ID="tpbtn" runat="server" Text="Show Top 10" CssClass="btn-sm btn-info" OnClick="tpbtn_Click" />
                                                   
                                                </div>
                                                <div class="col-sm-6">
                                                </div>
                                            </div>
                                            
                                            <div class="row top-margin">
                                                <div class="col-sm-6">
                                                    <asp:Button ID="bot" runat="server" Text="Show Bottom 10" CssClass="btn-sm btn-danger" OnClick="bot10_Click" />
                                                   
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


                                <br />
                               <p>
                                  <div class="col-md-9"><asp:Label ID="Label1" runat="server" CssClass="fa-2x"></asp:Label></p></div>
                                <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
                                    
                            </div>

                        </div>

                    </div>

                </div>
            </ContentTemplate>

        </asp:UpdatePanel>
</asp:Content>

