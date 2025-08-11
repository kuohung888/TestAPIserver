<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_3_1.aspx.cs" Inherits="Ch09_Default_book_3_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>透過超連結URL，各自展示Master-Detail</title>
</head>
<body>
    <p>
        透過超連結URL，各自展示Master-Detail</p>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1"
            Font-Size="Small" ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time"
                    SortExpression="test_time" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="Default_Disp.aspx?id={0}"
                    DataTextField="title">
                    <ItemStyle Font-Bold="True" Font-Size="Large" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
            </Columns>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
 
</body>
</html>
