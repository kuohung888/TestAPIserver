<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Excel.aspx.cs" Inherits="Ch11_GridView_Excel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridViewøÈ•X¶® Excel¿…</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1"
        Font-Size="Small" ForeColor="#333333">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="test_time" HeaderText="test_time"
                SortExpression="test_time" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="summary" HeaderText="summary"
                SortExpression="summary" />
            <asp:BoundField DataField="author" HeaderText="author"
                SortExpression="author" />
        </Columns>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
        SelectCommand="SELECT Top 10 [id], [test_time], [title], [summary], [author] FROM [test]"></asp:SqlDataSource>
    <br />

    <asp:Button ID="Button1" runat="server" Text="∂◊•X Excel File"
        OnClick="Button1_Click" />
    </form>

</body>
</html>
