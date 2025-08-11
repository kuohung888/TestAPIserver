<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_2_RadioButtonList.aspx.cs" Inherits="Book_Sample_Ch08_GridView_2_RadioButtonList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        使用 <strong>db_User</strong> Table<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="real_name" HeaderText="real_name" 
                    SortExpression="real_name" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
                <asp:TemplateField HeaderText="sex" SortExpression="sex">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                            SelectedValue='<%# Bind("sex") %>'>
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
                        <br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            SelectedValue='<%# Bind("sex") %>'>
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            DeleteCommand="DELETE FROM [db_user] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [db_user] ([real_name], [name], [password], [sex]) VALUES (@real_name, @name, @password, @sex)" 
            SelectCommand="SELECT [id], [real_name], [name], [password], [sex] FROM [db_user]" 
            UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [name] = @name, [password] = @password, [sex] = @sex WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

