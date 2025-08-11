<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Width_02_RowDataBound.aspx.cs" Inherits="Book_Sample_Ch11_GridView_Width_02_RowDataBound" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            background-color: #6699FF;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            color: #FF0000;
            font-weight: bold;
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
    
        <b>HOW TO：以動態方式設定 GridView Web 伺服器控制項的資料行寬度 <span class="style2">#2</span></b><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx">http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx</a>
        <br />
        <br />
        <span class="style5">本範例與 GridView_RowDataBound_3.aspx 相同</span><br />
        <br />
        <br />
        1.&nbsp; 寫在<span class="style3"> </span><span class="style4">RowDataBound事件</span>裡面。<br />
        2.&nbsp; 依照<b>第三個 title欄位（<span class="style3">Column(2)</span>）</b>的字元寬度，自動把欄位寬度乘以 50px<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            GridLines="Horizontal" onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" DataFormatString="{0:yyyy/MM/dd}" >
                <ItemStyle Font-Size="X-Small" />
                </asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#0033CC" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#0033CC" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 10  [id], [test_time], [title] FROM [test]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
