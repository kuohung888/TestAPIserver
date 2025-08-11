<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_GridView_Sorting_2.aspx.cs" Inherits="Book_Sample_Ch07_Default_GridView_Sorting_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #0066FF;
        }
        .style3
        {
            color: #3366FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        分頁與排序 #3<br />
        <br />
        排序後，該欄位的 [<span class="style1"><strong>表頭</strong></span>] 與 [<span 
            class="style2"><strong>格子（儲存格）</strong></span>]改變底色！<br />
        <br />
        SortedAscending<span class="style1"><strong>Header</strong></span>Style<br />
        SortedDescending<span class="style1"><strong>Header</strong></span>Style<br />
        <br />
        SortedAscending<span class="style3"><strong>Cell</strong></span>Style<br />
        SortedDescending<span class="style2"><strong>Cell</strong></span>Style<br /><br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" AllowPaging="True" AllowSorting="True" PageSize="5" 
            ForeColor="Black" GridLines="Vertical" Width="800px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time日期" 
                    SortExpression="test_time" DataFormatString="{0:yyyy/MM/dd}" />
                <asp:BoundField DataField="title" HeaderText="title標題" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary摘要" 
                    SortExpression="summary" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

            <SortedAscendingCellStyle BackColor="#CCFF99" />
            <SortedAscendingHeaderStyle BackColor="#009900" />
            <SortedDescendingCellStyle BackColor="#FFCCFF" />
            <SortedDescendingHeaderStyle BackColor="Red" />
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
