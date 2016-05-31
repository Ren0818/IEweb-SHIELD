<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="useradmin.aspx.cs" Inherits="_Default" %>
<script runat="server">

    void refreshGridUpdate(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
   
    GridView3.DataBind();
    }

    void refreshGridDelete(object sender, DetailsViewDeletedEventArgs e)
    {
        GridView1.DataBind();
    
    GridView3.DataBind();
    }

   void refreshGridInsert(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
   
    GridView3.DataBind();
    }
</script>
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
                    <li class="dropdown ">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="search.aspx">Top10</a>
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
    <style>
        /*Panel tabs*/
.panel-tabs {
    position: relative;
    bottom: 30px;
    clear:both;
    border-bottom: 1px solid transparent;
}

.panel-tabs > li {
    float: left;
    margin-bottom: -1px;
}

.panel-tabs > li > a {
    margin-right: 2px;
    margin-top: 4px;
    line-height: .85;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    color: #ffffff;
}

.panel-tabs > li > a:hover {
    border-color: transparent;
    color: #ffffff;
    background-color: transparent;
}

.panel-tabs > li.active > a,
.panel-tabs > li.active > a:hover,
.panel-tabs > li.active > a:focus {
    color: #fff;
    cursor: default;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    background-color: rgba(255,255,255, .23);
    border-bottom-color: transparent;
}
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">User Manangement</h3>
                        <span class="pull-right">
                            <!-- Tabs -->
                            <ul class="nav panel-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">Account</a></li>
                                
                                <li><a href="#tab3" data-toggle="tab">Commnents</a></li>

                            </ul>
                        </span>
                    </div>
                    <div class="panel-body">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">


                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserName" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="238px" Width="708px" OnItemDeleted="refreshGridDelete" OnItemInserted="refreshGridInsert" OnItemUpdated="refreshGridUpdate" >
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" OnClientClick="return confirm('Are you sure to update?')" ></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                        
                                        
                                        
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [RegisteredUsers] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [RegisteredUsers] ([UserName], [Password], [Email], [Gender]) VALUES (@UserName, @Password, @Email, @Gender)" SelectCommand="SELECT [UserName], [Password], [Email], [Gender] FROM [RegisteredUsers] WHERE ([UserName] = @userName)" UpdateCommand="UPDATE [RegisteredUsers] SET [Password] = @Password, [Email] = @Email, [Gender] = @Gender WHERE [UserName] = @UserName">
                                    <DeleteParameters>
                                        <asp:Parameter Name="UserName" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="UserName" Type="String" />
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="Gender" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userName" SessionField="userName" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Password" Type="String" />
                                        <asp:Parameter Name="Email" Type="String" />
                                        <asp:Parameter Name="Gender" Type="String" />
                                        <asp:Parameter Name="UserName" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>



                             
                                
                                <br />




                            </div>
                           
                            <div class="tab-pane" id="tab3">

                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [Thread] WHERE [threadId] = @threadId" InsertCommand="INSERT INTO [Thread] ([forumId], [answer], [posterName], [dateTim]) VALUES (@forumId, @answer, @posterName, @dateTim)" SelectCommand="select t.[threadId],f.[question],t.[answer],t.[posterName] as commenter, f.[posterName] as asker,t.[dateTim] from [Thread] t,[Forum] f where (t.posterName = @posterName and t.[forumId] = f.[forumId]) or (f.posterName = @posterName and t.[forumId] = f.[forumId]);" UpdateCommand="UPDATE [Thread] SET [forumId] = @forumId, [answer] = @answer, [posterName] = @posterName, [dateTim] = @dateTim WHERE [threadId] = @threadId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="threadId" Type="Int64" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="forumId" Type="Int64" />
                                        <asp:Parameter Name="answer" Type="String" />
                                        <asp:Parameter Name="posterName" Type="String" />
                                        <asp:Parameter Name="dateTim" Type="DateTime" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="posterName" SessionField="userName" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="forumId" Type="Int64" />
                                        <asp:Parameter Name="answer" Type="String" />
                                        <asp:Parameter Name="posterName" Type="String" />
                                        <asp:Parameter Name="dateTim" Type="DateTime" />
                                        <asp:Parameter Name="threadId" Type="Int64" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="threadId" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="708px" AllowSorting="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure to delete?')"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="threadId" HeaderText="Thread Id" InsertVisible="False" ReadOnly="True" SortExpression="threadId" />
                                        <asp:BoundField DataField="question" HeaderText="Topic" SortExpression="question" />
                                        <asp:BoundField DataField="answer" HeaderText="Comment" SortExpression="answer" />
                                        <asp:BoundField DataField="commenter" HeaderText="Comment Poster" SortExpression="commenter" />
                                        <asp:BoundField DataField="asker" HeaderText="Topic Poster" SortExpression="asker" />
                                        <asp:BoundField DataField="dateTim" HeaderText="Date" SortExpression="dateTim" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

