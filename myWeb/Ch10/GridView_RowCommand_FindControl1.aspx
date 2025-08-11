<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowCommand_FindControl1.aspx.cs" Inherits="Book_Sample_Ch10_GridView_RowCommand_FindControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
    
        在 RowCommand裡面，如何抓到按下按鈕的這一列 Index？<br />
        <br />
        RowCommand事件的 e.CommandSource該怎麼用？<br />
        <br />
        <br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
             AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" PageSize="5">
            <Columns>
                <asp:TemplateField HeaderText="test_time" SortExpression="test_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("test_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("test_time") %>'></asp:Label>
                        <asp:Button ID="Button1" runat="server" CommandName="Hello" Text="Button_Hello" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:TemplateField HeaderText="author" SortExpression="author">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle BackColor="#FFCCFF" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [test_time], [title], [author] FROM [test]"></asp:SqlDataSource>

    </form>
</body>
</html>
