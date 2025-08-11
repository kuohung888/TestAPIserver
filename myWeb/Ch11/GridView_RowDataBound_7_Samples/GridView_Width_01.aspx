<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Width_01.aspx.cs" Inherits="Book_Sample_Ch11_GridView_Width_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>HOW TO：以動態方式設定 GridView Web 伺服器控制項的資料行寬度 #1</b><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx">http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx</a>
        <br />
        <br />
        <br />
        <br />
        請輸入 <span class="style1">所有欄位</span>的<b>寬度</b>：<asp:TextBox ID="TextBox1" 
            runat="server" Width="59px" AutoPostBack="True" 
            ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        px <b>(AutoPostBack = true)</b><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
            GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
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
