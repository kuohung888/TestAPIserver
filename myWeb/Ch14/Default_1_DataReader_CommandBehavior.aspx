<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_1_DataReader_CommandBehavior.aspx.cs" Inherits="Ch14_Default_1_0_DataReader_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CommandBehavior</title>
</head>
<body>
    <form id="form1" runat="server">
    微軟SDK文件的範本----使用ADO.NET 的 <span style="color: #ff0000; background-color: #ffff33">SqlDataReader</span><br />
    Code Behind 完全手寫---- try...catch...finally<br />
    <br />
        <h3>DataReader的CommandBehavior</h3>

    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
        BorderWidth="1px" CellPadding="2" Font-Size="Small" ForeColor="Black" GridLines="None">
        <FooterStyle BackColor="Tan" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    </form>

</body>
</html>

