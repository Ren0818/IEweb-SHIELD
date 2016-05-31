<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminManager.aspx.cs" Inherits="adminManager" %>


<!DOCTYPE html>

    
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <title></title>
  <style type="text/css">
        
.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
      .with-nav-tabs.panel-primary .nav-tabs > li > a,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
    color: #fff;
}
.with-nav-tabs.panel-primary .nav-tabs > .open > a,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
	color: #fff;
	background-color: #3071a9;
	border-color: transparent;
}
.with-nav-tabs.panel-primary .nav-tabs > li.active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
	color: #428bca;
	background-color: #fff;
	border-color: #428bca;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #428bca;
    border-color: #3071a9;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #fff;   
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #3071a9;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    background-color: #4a9fe9;
}
      </style>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
      
<body>
        <form id="form1" runat="server">
        <div class="col-md-12">
            <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1primary" data-toggle="tab">User Manage</a></li>
                            <li><a href="#tab2primary" data-toggle="tab">Forum Topic Manage</a></li>
                            <li><a href="#tab3primary" data-toggle="tab">Comments Manage</a></li>
                            <li><a href="#tab5primary" data-toggle="tab">Contact Manage</a></li>
                           <li><a href="#tab4primary" data-toggle="tab">Finish & Go Back to Home Page</a></li>
                           
                        </ul>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="panel-body">
                    <div class="tab-content">
                        
                        <div class="tab-pane fade in active" id="tab1primary">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                   
                            <h2>User Manage</h2>
                         
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserName" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="766px" PageSize="20">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure to update?')"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure to delete?')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                    <asp:BoundField DataField="activated" HeaderText="activated" SortExpression="activated" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [RegisteredUsers] WHERE [UserName] = @UserName" InsertCommand="INSERT INTO [RegisteredUsers] ([UserName], [Password], [Email], [Gender], [activated]) VALUES (@UserName, @Password, @Email, @Gender, @activated)" SelectCommand="SELECT * FROM [RegisteredUsers]" UpdateCommand="UPDATE [RegisteredUsers] SET [Password] = @Password, [Email] = @Email, [Gender] = @Gender, [activated] = @activated WHERE [UserName] = @UserName">
                                <DeleteParameters>
                                    <asp:Parameter Name="UserName" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="UserName" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Gender" Type="String" />
                                    <asp:Parameter Name="activated" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Gender" Type="String" />
                                    <asp:Parameter Name="activated" Type="String" />
                                    <asp:Parameter Name="UserName" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                           
                            <br />
                         
                       
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        </div> 
                        <div class="tab-pane fade" id="tab2primary">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                
                       
                            <h2>Forum Topic Manage</h2>
                                   <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="forumId" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" PageSize="30" Width="767px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure to update?')"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="forumId" HeaderText="forumId" InsertVisible="False" ReadOnly="True" SortExpression="forumId" />
                                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                                    <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" />
                                    <asp:BoundField DataField="PosterName" HeaderText="PosterName" SortExpression="PosterName" />
                                    <asp:BoundField DataField="dateTim" HeaderText="dateTim" SortExpression="dateTim" />
                                    <asp:BoundField DataField="hide" HeaderText="hide" SortExpression="hide" />
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
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [Forum] WHERE [forumId] = @forumId" InsertCommand="INSERT INTO [Forum] ([city], [question], [PosterName], [dateTim], [hide]) VALUES (@city, @question, @PosterName, @dateTim, @hide)" SelectCommand="SELECT * FROM [Forum]" UpdateCommand="UPDATE [Forum] SET [city] = @city, [question] = @question, [PosterName] = @PosterName, [dateTim] = @dateTim, [hide] = @hide WHERE [forumId] = @forumId">
                                <DeleteParameters>
                                    <asp:Parameter Name="forumId" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="city" Type="String" />
                                    <asp:Parameter Name="question" Type="String" />
                                    <asp:Parameter Name="PosterName" Type="String" />
                                    <asp:Parameter Name="dateTim" Type="DateTime" />
                                    <asp:Parameter Name="hide" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="city" Type="String" />
                                    <asp:Parameter Name="question" Type="String" />
                                    <asp:Parameter Name="PosterName" Type="String" />
                                    <asp:Parameter Name="dateTim" Type="DateTime" />
                                    <asp:Parameter Name="hide" Type="String" />
                                    <asp:Parameter Name="forumId" Type="Int64" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        </div>
                        <div class="tab-pane fade" id="tab3primary">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                
                            <h2>Comments Manage</h2>
                            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="threadId" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="764px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClientClick="return confirm('Are you sure to update?')"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure to delete?')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="threadId" HeaderText="threadId" InsertVisible="False" ReadOnly="True" SortExpression="threadId" Visible="False" />
                                    <asp:BoundField DataField="forumId" HeaderText="forumId" SortExpression="forumId" />
                                    <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
                                    <asp:BoundField DataField="posterName" HeaderText="posterName" SortExpression="posterName" />
                                    <asp:BoundField DataField="dateTim" HeaderText="dateTim" SortExpression="dateTim" />
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
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [Thread] WHERE [threadId] = @threadId" InsertCommand="INSERT INTO [Thread] ([forumId], [answer], [posterName], [dateTim]) VALUES (@forumId, @answer, @posterName, @dateTim)" SelectCommand="SELECT * FROM [Thread]" UpdateCommand="UPDATE [Thread] SET [forumId] = @forumId, [answer] = @answer, [posterName] = @posterName, [dateTim] = @dateTim WHERE [threadId] = @threadId">
                                <DeleteParameters>
                                    <asp:Parameter Name="threadId" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="forumId" Type="Int64" />
                                    <asp:Parameter Name="answer" Type="String" />
                                    <asp:Parameter Name="posterName" Type="String" />
                                    <asp:Parameter Name="dateTim" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="forumId" Type="Int64" />
                                    <asp:Parameter Name="answer" Type="String" />
                                    <asp:Parameter Name="posterName" Type="String" />
                                    <asp:Parameter Name="dateTim" Type="DateTime" />
                                    <asp:Parameter Name="threadId" Type="Int64" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                    
                            </ContentTemplate>
                        </asp:UpdatePanel>
                                </div>
                                    
                        <div class="tab-pane fade" id="tab5primary" runat="server">
                           
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                      
                            <h2>Contact Manage</h2>
                            
                                 <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Width="764px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure to delete?')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="mnum" HeaderText="Moblie Number" SortExpression="mnum" />
                                    <asp:BoundField DataField="mes" HeaderText="Message" SortExpression="mes" />
                                    <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chkEmail" />
                </ItemTemplate>
            </asp:TemplateField>
                                </Columns>
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
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FIT5120-StarTech-DatabaseConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [Id] = @Id"  SelectCommand="SELECT * FROM [contact]" >
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int64" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                     
                            </ContentTemplate>
                        </asp:UpdatePanel>
                               <table class="emailTable">
        <tr>
            <td class="emailHeader" width="15%">From</td>
            <td class="emailRow">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="emailHeader" width="15%">Subject</td>
            <td class="emailRow">
                
                <asp:TextBox ID="txtSubject" Width="350" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="emailHeader">Message</td>
            <td class="emailRow">
                <asp:TextBox runat="server" ID="txtMsg"
                    TextMode="MultiLine" Columns="55" Rows="15" />
            </td>
        </tr>
    </table>
                                                  
                      <asp:Button ID="SendMail" runat="server"
        OnClick="SendEmail" Text="Send Email" /><br />
                        </div>
                       
                         <div class="tab-pane fade" id="tab4primary">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                 
                        <a href="index.aspx">Home Page</a>    
                     
                        
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        </div>

                      
                    </div>
                </div>
            </div>
       </div>
	
    
            
    <br />
        </form>
	
    
</body>

</html>
   