<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_3.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CCFFFF;
            font-weight: bold;
            background-color: #000099;
        }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            color: #FF0000;
        }
        .style5
        {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        GridView的 <span class="style1">RowDataBound事件 #3</span>&nbsp; <b>System.Data.DataRowView</b><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
        <br />
        <br />
        本範例來源：<a href="http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx"><span class="style2">http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx</span></a>
        <br />
        <span class="style5">本範例與 GridView_Width_02_RowDataBound.aspx 相同</span><br />
        <br />
        <br />
        <b>GridView裡面，自動依照<span class="style3">資料行（title欄位，第二個欄位）的寬度</span>設為<span 
            class="style3">字元數乘以 30</span> <br />
        </b>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]">
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
