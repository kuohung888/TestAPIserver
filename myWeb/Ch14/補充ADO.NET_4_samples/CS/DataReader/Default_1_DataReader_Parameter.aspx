<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_1_DataReader_Parameter.aspx.cs" Inherits="_Book_New_Samples_DB_DataReader_Default_1_DataReader_Parameter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>使用ADO.NET 的 SqlDataReader</title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style2
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        微軟SDK文件的範本----使用ADO.NET 的 <span style="color: #ff0000; background-color: #ffff33">SqlDataReader</span><br />
        <span class="style2">參數，SqlComand的 Parameter</span><br />
        <br />
        Code Behind 完全手寫---- try...catch...finally<br />
        <br />
        <span class="style1">請在網址URL，輸入 ?id=10</span><br />
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
