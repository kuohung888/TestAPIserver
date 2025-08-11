<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Case_01.aspx.cs" Inherits="Book_Sample_Ch10_Case_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>兩個控制項<span class="style1">連動</span></b>，<br />
        點選底下 DetailsView資料，上面的 GridView也會跟著分頁或是出現光棒效果。<br />
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" 
            PageSize="5" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" onpageindexchanging="GridView1_PageIndexChanging">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]"></asp:SqlDataSource>
        <br />

        <hr />
    
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="3" DataKeyNames="id" 
            DataSourceID="SqlDataSource2" GridLines="Horizontal" 
            Height="50px" Width="500px" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" 
            onpageindexchanging="DetailsView1_PageIndexChanging">
            <PagerSettings Position="TopAndBottom" PageButtonCount="20" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" 
                    SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="article" 
                    SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="author" 
                    SortExpression="author" />
                <asp:BoundField DataField="hit_no" HeaderText="hit_no" 
                    SortExpression="hit_no" />
                <asp:BoundField DataField="get_no" HeaderText="get_no" 
                    SortExpression="get_no" />
                <asp:BoundField DataField="email_no" HeaderText="email_no" 
                    SortExpression="email_no" />
                <asp:BoundField DataField="approved" HeaderText="approved" 
                    SortExpression="approved" />
            </Fields>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

