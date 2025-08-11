<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_Disp.aspx.cs" Inherits="Ch12_ListView_Default_Disp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>呈現文章的細部內容 (Details)</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
            DataKeyNames="id" DataSourceID="SqlDataSource1">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time"
                    SortExpression="test_time" />
                <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="article" SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:BoundField DataField="hit_no" HeaderText="hit_no" SortExpression="hit_no" />
                <asp:BoundField DataField="get_no" HeaderText="get_no" SortExpression="get_no" />
                <asp:BoundField DataField="email_no" HeaderText="email_no" SortExpression="email_no" />
                <asp:BoundField DataField="approved" HeaderText="approved" SortExpression="approved" />
            </Columns>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT * FROM [test] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
 
</body>
</html>
