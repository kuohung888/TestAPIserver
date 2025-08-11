<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Multi_PK_2_Session.aspx.cs" Inherits="Book_Sample_Ch09_GridView_Multi_PK_2_Session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> [多個] P.K.主索引鍵 #2 </title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FF9933;
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
            CellPadding="4" DataKeyNames="id,title" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
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
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 * FROM [test]"></asp:SqlDataSource>    
    
        <!-- ******************************************************************* -->
        <br />
        <br />
        第二個 GridView2，<span class="style1">搭配SqlDataSource，並且使用 Session</span><br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource2" 
            ForeColor="Black" GridLines="Vertical">
            <Columns>
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
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test] WHERE (([id] = @id) AND ([title] = @title))">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="s_id" Type="Int32" />
                <asp:SessionParameter Name="title" SessionField="s_title" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
 
</body>
</html>
