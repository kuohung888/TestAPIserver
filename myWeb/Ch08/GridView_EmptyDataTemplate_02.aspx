<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_EmptyDataTemplate_02.aspx.cs" Inherits="Book_Sample_Ch08_GridView_EmptyDataTemplate_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            background-color: #CC99FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>EmptyData</strong>Template #2<br />
        <br />
        <strong><span class="style3">ShowHeaderWhenEmpty屬性</span></strong>，需要搭配<strong><span 
            class="style3"> EmptyDataTemplate</span></strong>才能生效！<br />
        <br />
        即使找不到任何一筆紀錄，也會出現 <strong>GridView表頭</strong><br />
        <br />
        故意把 SQL指令改成找不到紀錄 --<span class="style1"><br />
&nbsp;SELECT [id], [title], [test_time], 
        [author] FROM [test] <span class="style2"><strong>where [id] =111111</strong></span></span><br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
            GridLines="Horizontal" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="author" HeaderText="author" 
                    SortExpression="author" />
            </Columns>

            <EmptyDataTemplate>
                <strong>抱歉！！！<br /> &nbsp;&nbsp;&nbsp; 沒有找到任何紀錄～</strong>
            </EmptyDataTemplate>

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
            ConnectionString="<%$ ConnectionStrings:testConnectionString1 %>" 
            SelectCommand="SELECT [id], [title], [test_time], [author] FROM [test] where [id] =111111">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
