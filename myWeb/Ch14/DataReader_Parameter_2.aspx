<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataReader_Parameter_2.aspx.cs" Inherits="_Book_New_Samples_DB_DataReader_Default_1_DataReader_Parameter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        <span class="style2">參數，SqlComand的 Parameter，使用多個參數</span><br />
        <br />
        Code Behind 完全手寫---- try...catch...finally<br />
        <br />
        <span class="style1">請在網址URL，輸入 ?id=10</span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#336666"
            BorderWidth="3px" CellPadding="4" Font-Size="Small" GridLines="Horizontal" BorderStyle="Double">
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>

    </form>


</body>
</html>
