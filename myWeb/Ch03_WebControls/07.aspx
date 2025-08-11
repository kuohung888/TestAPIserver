<%@ Page Language="C#" AutoEventWireup="true" CodeFile="07.aspx.cs" Inherits="Ch03_WebControls_7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ListBox + SqlDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="title"
            DataValueField="id"></asp:ListBox>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
