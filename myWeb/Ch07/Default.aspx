<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Book_Sample_Ch07_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="article" SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:BoundField DataField="hit_no" HeaderText="hit_no" SortExpression="hit_no" />
                <asp:BoundField DataField="get_no" HeaderText="get_no" SortExpression="get_no" />
                <asp:BoundField DataField="email_no" HeaderText="email_no" SortExpression="email_no" />
                <asp:BoundField DataField="approved" HeaderText="approved" SortExpression="approved" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
