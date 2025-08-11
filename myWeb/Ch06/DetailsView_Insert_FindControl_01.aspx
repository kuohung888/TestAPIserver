<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsView_Insert_FindControl_01.aspx.cs" Inherits="DetailsView_Insert_Copy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>DetailsView</strong>想要在「編輯」、「新增」模式下，用.FindControl()抓到樣板裡面的子控制項<br />
        <br />
        只能使用 <span class="auto-style1"><strong>ItemCreated事件</strong></span>。<br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="295px" 
            
            OnModeChanged="DetailsView1_ModeChanged" 
            OnItemCreated="DetailsView1_ItemCreated" OnItemCommand="DetailsView1_ItemCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="title" SortExpression="title">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" Text="我是編輯模式下的TextBox2"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server" Text="我是新增模式下的TextBox2"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="80px" />
                </asp:TemplateField>
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:CommandField ShowInsertButton="True" ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([title], [author]) VALUES (@title, @author)" SelectCommand="SELECT [id], [title], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [title] = @title, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
