<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_2_2_DataSet_GridView.aspx.cs" Inherits="_Book_New_Samples_DB_DataSet_Default_2_2_DataSet_GridView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ADO.NET -- DataSet</title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #0000FF;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        微軟SDK文件的範本----使用ADO.NET 的 
        <span style="background-color: #ffff33" class="style1">SqlDataAdapter + DataSet</span><br />
        Code Behind 完全手寫<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999"
            BorderWidth="1px" CellPadding="3" Font-Size="Small" ForeColor="Black" 
            GridLines="Vertical" BorderStyle="Solid" AllowPaging="True" 
            AllowSorting="True" EnableSortingAndPagingCallbacks="True">
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </form>
    <p>
        AutoPaging可以啟動，功能正常。</p>
    <p>
        Auto<span class="style2">Sorting</span>啟動後，<span class="style2">無法運作！</span></p>
</body>
</html>
