<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_4_0_SqlDataSource.aspx.cs" Inherits="Book_Sample_Ch14_Default_4_0_SqlDataSource" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>自動化，不用寫程式</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        自動化，不用寫程式<br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1"
            Font-Size="Small" ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
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
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="select * from test"></asp:SqlDataSource>

    </div>
    </form>


</body>
</html>
