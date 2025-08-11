<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_GridView_Page.aspx.cs" Inherits="Book_Sample_Ch07_Default_GridView_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    分頁與排序&nbsp; --
        <br />
        <br />
&nbsp;&nbsp;&nbsp; 啟動GridVeiw的<strong>EnableSortingAndPagingCallbacks=&quot;True&quot;</strong>。 
        <br />
&nbsp;&nbsp;&nbsp; GridView又<strong>開啟「選取（Select）」</strong>的命令欄位，<span class="auto-style1"><strong>兩者並行時就會出錯</strong></span>。
    <br /><br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time日期" 
                    SortExpression="test_time" DataFormatString="{0:yyyy/MM/dd}" />
                <asp:BoundField DataField="title" HeaderText="title標題" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary摘要" 
                    SortExpression="summary" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>


