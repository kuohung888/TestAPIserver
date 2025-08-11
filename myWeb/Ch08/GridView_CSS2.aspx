<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_CSS2.aspx.cs" Inherits="GridView_CSS2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="GridView_CSS_Images/GridView_CSS.css" type="text/css">
    <style>/* roScripts
Table Design by Mihalcea Romeo
www.roscripts.com
----------------------------------------------- */

table {
		border-collapse:collapse;
		background:#EFF4FB url(GridView_CSS_Images/teaser.gif) repeat-x;
		border-left:1px solid #686868;
		border-right:1px solid #686868;
		font:0.8em/145% 'Trebuchet MS',helvetica,arial,verdana;
		color: #333;
}

td, th {
		padding:5px;
}

caption {
		padding: 0 0 .5em 0;
		text-align: left;
		font-size: 1.4em;
		font-weight: bold;
		text-transform: uppercase;
		color: #333;
		background: transparent;
}

/* =links
----------------------------------------------- */

table a {
		color:#950000;
		text-decoration:none;
}

table a:link {}

table a:visited {
		font-weight:normal;
		color:#666;
		text-decoration: line-through;
}

table a:hover {
		border-bottom: 1px dashed #bbb;
}

/* =head =foot
----------------------------------------------- */

thead th, tfoot th, tfoot td {
		background:#333 url(GridView_CSS_Images/llsh.gif) repeat-x;
		color:#fff
}

tfoot td {
		text-align:right
}

/* =body
----------------------------------------------- */

tbody th, tbody td {
		border-bottom: dotted 1px #333;
}

tbody th {
		white-space: nowrap;
}

tbody th a {
		color:#333;
}

.odd {}

tbody tr:hover {
		background:#fafafa
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>


        <br />
        搭配 CSS表格的 GridView&nbsp; (名稱：Blue gradient)<br />
        <br />
        CSS來源&nbsp; <a href="http://icant.co.uk/csstablegallery/tables/89.php">http://icant.co.uk/csstablegallery/tables/89.php</a>
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title]) VALUES (@test_time, @title)" SelectCommand="SELECT [id], [test_time], [title] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        簡單的CSS教學：<a href="http://www.tad0616.net/modules/tad_book3/page.php?tbdsn=74">http://www.tad0616.net/modules/tad_book3/page.php?tbdsn=74</a>


        <br />
        <br />
        善用 CSS 中的 table-layout 屬性加快 Table 的顯示速度 
        <br />
        <a href="http://blog.miniasp.com/post/2009/04/20/Use-CSS-table-layout-property-to-speed-up-table-rendering.aspx">http://blog.miniasp.com/post/2009/04/20/Use-CSS-table-layout-property-to-speed-up-table-rendering.aspx</a>

    </div>
    </form>
</body>
</html>
