<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_3_2.aspx.cs" Inherits="Ch09_Default_book_3_2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="id" DataSourceID="SqlDataSource1" Font-Size="Small"
            ForeColor="#333333" GridLines="None" PageSize="5">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}"
                    HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                    <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="summary" HeaderText="summary"
                    SortExpression="summary" />
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
        <p>
            &nbsp;
        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource2">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
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
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString2 %>"
            SelectCommand="SELECT * FROM [test] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    </form>

</body>
</html>
