<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="forum.aspx.cs" Inherits="_Default" %>

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
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="top10.aspx">Top 10</a>
                            </li>
                            <li class="active">
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li>
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
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
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Discussion forum </li>
        </ol>
        <p>
            Please select the city name before accessing the forum.


            The forum topics are different from different areas.</p>
        <div class="panel-info">
            <div class="col-md-8">
                <asp:DropDownList ID="DropDownListCities" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityName" AutoPostBack="True"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" SelectCommand="SELECT * FROM [cities]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" DataKeyNames="forumId" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="forumId" HeaderText="forumId" SortExpression="forumId" InsertVisible="False" ReadOnly="True">

                        <ItemStyle Width="10%" />

                        </asp:BoundField>
                        <asp:BoundField DataField="question" HeaderText="Topic" SortExpression="question" >
                        <ItemStyle Width="70%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PosterName" HeaderText="Poster" SortExpression="PosterName" >
                        <ItemStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateTim" HeaderText="Date" SortExpression="dateTim" >
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                        <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandName="select" Height="41px" Text="View Comments" Width="178px" CssClass="btn-link" />
                    </ItemTemplate>
                            <ItemStyle Width="10%" />
                </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" SelectCommand="SELECT [forumId],[question], [PosterName], [dateTim] FROM [Forum] WHERE([city]=@city) AND [hide]='no'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListCities" Name="city" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
            </div>
            <br />
            <div class="col-md-8">
                <asp:TextBox ID="TextBoxForumArea" runat="server" CssClass="form-control counted" Style="margin-bottom: 10px" Height="185px" TextMode="MultiLine"></asp:TextBox>




                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxForumArea" ErrorMessage="Please input something." ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                <asp:Button ID="ButtonPost" runat="server" Text="Post New Topic" class="btn btn-info" OnClick="ButtonPost_Click" ValidationGroup="abc" />
            </div>

        </div>
    </div>


</asp:Content>

