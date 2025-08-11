<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_1_0_DataReader_Manual.aspx.vb" Inherits="test_ADO_NET_Default_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ADO.NET -- DataReader</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        微軟SDK文件的範本----使用ADO.NET 的 
        <span style="color: #ff0000; background-color: #ffff33" class="style1">SqlDataReader</span><br />
        Code Behind 完全手寫---- Try...Catch...Finally<br />
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
