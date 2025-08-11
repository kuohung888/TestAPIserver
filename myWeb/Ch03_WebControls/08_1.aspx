<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_1.aspx.cs" Inherits="Ch03_WebControls_8_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CheckBoxList </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1"
            DataTextField="title" DataValueField="id">
        </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="select top 7 id,title from test"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button--想看哪幾篇文章？可複選！" OnClick="Button1_Click" />
        <br />
        <br />
        您想看這幾篇文章（ID編號）？&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </div>
    </form>
</body>
</html>
