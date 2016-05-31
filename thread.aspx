<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="thread.aspx.cs" Inherits="thread" %>

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
                            <li>
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="forum.aspx" class="active">Discuss</a>
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
   <header id="head" class="secondary"></header>
    <div class="container" style="background-color:white">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
         <li><a href="forum.aspx">Discuss</a></li>
            <li>Thread</li>
        </ol>
         <div class="panel panel-default">
             <div class="panel-heading">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="">City:
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                <br />
                Topic:
                <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                <br />
                Poster:
                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">City:
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                <br />
                Topic:
                <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                <br />
                Poster:
                <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">City:
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                <br />
                Topic:
                <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                <br />
                Poster:
                <asp:TextBox ID="PosterTextBox" runat="server" Text='<%# Bind("Poster") %>' />
                <br />
                Date:
                <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="">City:
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                <br />
                Topic:
                <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                <br />
                Poster:
                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        
        <SelectedItemTemplate>
            <td runat="server" style="">City:
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                <br />
                Topic:
                <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                <br />
                Poster:
                <asp:Label ID="PosterLabel" runat="server" Text='<%# Eval("Poster") %>' />
                <br />
                Date:
                <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
  </div>
             <div class="panel-body">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" SelectCommand="SELECT [city] as City, [question] as Topic, [PosterName] as Poster, [dateTim] as Date FROM [Forum] WHERE [forumId] = @forumId">
            <SelectParameters>
                <asp:SessionParameter Name="forumId" SessionField="forumId" />
            </SelectParameters>
        </asp:SqlDataSource>
              
        
        
        
        <div class="col-md-12">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="200px" Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="answer" HeaderText="Comments" SortExpression="answer" >
                <ItemStyle Width="80%" />
                </asp:BoundField>
                <asp:BoundField DataField="posterName" HeaderText="Poster" SortExpression="posterName" >
                <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="dateTim" HeaderText="Date" SortExpression="dateTim" >
                <ItemStyle Width="10%" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" SelectCommand="SELECT [answer], [posterName], [dateTim] FROM [Thread] WHERE ([forumId] = @forumId)">
            <SelectParameters>
                <asp:SessionParameter Name="forumId" SessionField="forumId" />
            </SelectParameters>
        </asp:SqlDataSource>

           
             <br/><br/><br/>
         
        <div class="col-md-9">
        <asp:TextBox ID="TextBoxAnswer" runat="server" Height="180px" TextMode="MultiLine" Width="100%"></asp:TextBox>
      
    
            <br />
            <br />
      
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxAnswer" ErrorMessage="Please input something." ForeColor="Red"></asp:RequiredFieldValidator>
        <br/>
        <asp:Button ID="ButtonPost" runat="server" Text="Post New Comment" class="btn btn-info" OnClick="ButtonPost_Click"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="forum.aspx" class="btn btn-info">Back</a>
        
            </div>
            </div>
</div>
             </div>
         
    </div>
</asp:Content>

