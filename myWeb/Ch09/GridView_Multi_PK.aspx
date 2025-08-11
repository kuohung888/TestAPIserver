<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Multi_PK.aspx.cs" Inherits="Book_Sample_Ch09_GridView_Multi_PK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>  [多個] P.K.主索引鍵 #1 </title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
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
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" style="color: #FF0000"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id,title" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#E3EAEB" />
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
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 15 * FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

