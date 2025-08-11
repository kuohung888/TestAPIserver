<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2.aspx.cs" Inherits="Ch06_2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DetailsView #1</title>
</head>
<body>
    <p>
        DetailsView</p>
    <form id="form1" runat="server">
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" 
            Width="600px">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" 
                HorizontalAlign="Center" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="日期" 
                    SortExpression="test_time" >
                <HeaderStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="class" HeaderText="文章分類" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="摘要" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="內容（全文）" 
                    SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="hit_no" HeaderText="點閱次數" SortExpression="hit_no" />
                <asp:BoundField DataField="get_no" HeaderText="評分" SortExpression="get_no" />
                <asp:BoundField DataField="email_no" HeaderText="文章轉寄次數" 
                    SortExpression="email_no" />
                <asp:BoundField DataField="approved" HeaderText="審核？是否可發表？" 
                    SortExpression="approved" />
            </Fields>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [test]">
        </asp:SqlDataSource>
            
            
    </p>
    <div>
    
    </div>
    </form>
 
</body>
</html>
