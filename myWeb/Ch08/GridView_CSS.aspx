<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_CSS.aspx.cs" Inherits="GridView_CSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="GridView_CSS_Images/GridView_CSS.css" type="text/css">
    <style>
*
{
	border: 0;
	margin: 0;
	padding: 0;
}

table 
{
	text-align: left;
	border-spacing: 0px;
	border: 1px solid #aeb3b6;
	border-collapse: collapse;
	
}


table a, table, tbody, tfoot, tr, th, td 
{
   font-family: Arial, Helvetica, sans-serif;
	line-height: 2.0em;
	font-size: 13px;
	color: #55595c;
}
tbody td{
	line-height: 2.5em;
}

table caption
{
	padding: .4em 0 ;
	font-size: 240%;
	font-style: normal;
	color: #FB7E00;
}

table a
{
	display: block;
	text-decoration: none;
	color: #FF8E53;
	padding-right: 1.5em;
	
}

table a:hover, table a:focus
{
text-decoration: underline;
}

table th a
{
	color: #FF8E53;
	text-align: right;
}
table .odd th a,table .odd td a,table .odd td{
	color: #666;
	padding-right: 1.0 em;
}

table th a:hover, table th a:focus, tbody tr:hover th
{   
   background-color: #FFCC99;
	color: #fff !important;
}
table .odd th,table .odd td{
	background-color: #DDDDDD;
}

thead th
{
	background-image: url(GridView_CSS_Images/verlauf_schwarz.gif);
	text-transform: uppercase;
	font-weight: normal;
	letter-spacing: 1px;
	color: #fff;
	
}
tfoot{
	background-image: url(GridView_CSS_Images/verlauf_schwarz.gif);
	border-top: 1px solid #fff;
	
	
}
tfoot th,tfoot td{
	color: #fff;
}

tbody th
{
   padding-right: 1.0em;
	color: #25c1e2;
	font-style: normal;
	background-color: #fff;
	border-bottom: 1px dotted #aeb3b6;
}

td
{
   color: #FF8E1C;
	border-bottom: 1px dotted #aeb3b6;
	padding-right: 0.5em;
	
}

tbody tr.odd
{
	border-bottom: 1px dotted #aeb3b6;
}

tbody tr:hover td
{
  background-color: #FFCC99;
}

tbody tr:hover td,tbody tr:hover th, tbody tr:hover a
{
	color: #fff !important;
}</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        搭配 CSS表格的 GridView&nbsp; (名稱：orange and grey)<br />
        <br />
        CSS來源&nbsp; <a href="http://icant.co.uk/csstablegallery/tables/32.php">http://icant.co.uk/csstablegallery/tables/32.php</a>
        <br />

        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server"
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" Caption="GridView的Caption">
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
