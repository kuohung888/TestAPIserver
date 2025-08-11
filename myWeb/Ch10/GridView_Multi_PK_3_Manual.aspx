<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Multi_PK_3_Manual.aspx.cs" Inherits="Book_Sample_Ch09_GridView_Multi_PK_3_Manual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>  [多個] P.K.主索引鍵 #3 </title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-size: x-large;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        GridView對應的資料表，有 [多個] P.K.主索引鍵。<br />
        請看 GridView的<span class="style1">「DataKeyNames」屬性</span><br />
        &nbsp;&nbsp;&nbsp;
        （本範例設定為 id與 title為主索引鍵）<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="3" DataKeyNames="id,title" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Vertical" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" 
                    SortExpression="summary" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 * FROM [test]"></asp:SqlDataSource>    
        <br />
        <br />
        <span class="style1">請注意！！底下的 GridView2並<span class="style2">沒有</span> SqlDataSource，是空的！<br />
        </span>
        <br />


        <asp:GridView ID="GridView2" runat="server" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
        <br />
    </div>
    </form>
</body>
</html>
