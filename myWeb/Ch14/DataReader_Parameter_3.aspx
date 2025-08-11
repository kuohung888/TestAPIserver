<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataReader_Parameter_3.aspx.cs" Inherits="DataReader_Parameter" %>

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
        <span class="style2">參數，SqlComand的 Parameter，使用多個參數 + params的寫法</span><br />
        <br />
        Code Behind 完全手寫---- try...catch...finally<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC"
            BorderWidth="1px" CellPadding="3" Font-Size="Small" BorderStyle="None">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <br />
        **** 有時method裡,引數數量並不是固定的,就可以用params來宣告 ****&nbsp; <br />
        <a href="http://www.allenkuo.com/EBook5/view.aspx?a=1&amp;TreeNodeID=123&amp;id=603">http://www.allenkuo.com/EBook5/view.aspx?a=1&amp;TreeNodeID=123&amp;id=603</a>

    </form>


</body>
</html>
