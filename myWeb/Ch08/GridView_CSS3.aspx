<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_CSS3.aspx.cs" Inherits="GridView_CSS3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="GridView_CSS_Images/GridView_CSS.css" type="text/css">
    <style>table {
	width: 650px;
	border:1px solid #000000;
	border-spacing: 0px; }

table a, table, tbody, tfoot, tr, th, td {
	font-family: Arial, Helvetica, sans-serif;
}

table caption {
	font-size: 1.8em;
	text-align: left;
	text-indent: 100px;
	background: url(GridView_CSS_Images/bg_caption.gif) left top;
	height: 40px;
	color: #FFFFFF;
	border:1px solid #000000; }

tr th {
	background: url(GridView_CSS_Images/bg_th.gif) left;
	height: 21px;
	color: #FFFFFF;
	font-size: 0.8em;
	font-family: Arial;
	font-weight: bold;
	padding: 0px 7px;
	margin: 20px 0px 0px;
	text-align: left; }

tbody tr {	background: #ffffff; }

tbody tr.odd {	background: #f0f0f0; }

tbody th {
	background: url(GridView_CSS_Images/arrow_white.gif) left center no-repeat;
	background-position: 5px;
	padding-left: 40px !important; }

tbody tr.odd th {
	background: url(GridView_CSS_Images/arrow_grey.gif) left center no-repeat;
	background-position: 5px;
	padding-left: 40px !important; }

tbody th, tbody td {
	font-size: 0.8em;
	line-height: 1.4em;
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
	padding: 10px 7px;
	border-bottom: 1px solid #800000;
	text-align: left; }

tbody a {
	color: #000000;
	font-weight: bold;
	text-decoration: none; }

tbody a:hover {
	color: #ffffff;
	text-decoration: underline; }

tbody tr:hover th {
	background: #800000 url(GridView_CSS_Images/arrow_red.gif) left center no-repeat;
	background-position: 5px;
	color: #ffffff; }

tbody tr.odd:hover th {
	background: #000000 url(GridView_CSS_Images/arrow_black.gif) left center no-repeat;
	background-position: 5px;
	color: #ffffff; }

tbody tr:hover th a, tr.odd:hover th a	{
		 color: #ffffff; }

tbody tr:hover td, tr:hover td a, tr.odd:hover td, tr.odd:hover td a {
	background: #800000;
	color: #ffffff;	 }

tbody tr.odd:hover td, tr.odd:hover td a{
	background: #000000;
	color: #ffffff;	 }

tfoot th, tfoot td {
	background: #ffffff url(GridView_CSS_Images/bg_footer.gif) repeat-x bottom;
	font-size: 0.8em;
	color: #ffffff;
	height: 21px;
	}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <br />
        搭配 CSS表格的 GridView&nbsp; (名稱：Blue gradient)<br />
        <br />
        CSS來源&nbsp; <a href="http://icant.co.uk/csstablegallery/tables/85.php">http://icant.co.uk/csstablegallery/tables/85.php</a>
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" Caption="GridView的 Caption">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>
        <br />
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
