<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_4_CSS_CodeBehind.aspx.cs" Inherits="Book_Sample_Ch11_Default_book_GridView_Light_4_CSS_CodeBehind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>[光棒]滑鼠指向變色的表格_CSS</title>
    <style type="text/css">

        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style1 {
            background-color: #FFFF00;
        }
        .style2
        {
            color: #CC0000;
        }
        </style>


    <!--  以下是CSS的外觀！！ -->
    <style>
        p, td,th{
	        font:0.8em Arial, Helvetica, sans-serif;
        }
        .datatable{
	        border:1px solid #d6dde6;
	        border-collapse:collapse;
	        width:80%;
        }
        .datatable td:hover{
	        cursor:pointer;
	        }
        .datatable td{
	        border:1px solid #d6dde6;
	        padding:4px;
	        }
        .datatable tr:hover{
	        background-color:#F60;
	        color:#000000;
	        }
        .datatable th{
	        border:1px solid #828282;
	        background-color:#bcbcbc;
	        font-weight:bold;
	        text-align:left;
	        padding-left:4px;
        }
        .datatable caption{
	        font:bold 0.9em Arial, Helvetica, sans-serif;
	        color:#33517a;
	        text-align:left;
	        padding-top:3px;
	        padding-bottom:8px;
        }
        .datatable tr.altrow{
	        background-color:#dfe7f2;
	        }
        .datatable tr.altrow:hover{
	        background-color:#F60;
	        }

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        動態加入「光棒效果」的 CSS 到 GridView<span class="style3">每一列</span>裡面。<br />
        <b>使用GridView的 <span class="style1">RowDataBound事件</span></b><br />
        <br />
        <br />
        <span class="style2">請您參閱範例 -- <strong>[光棒]滑鼠指向變色的表格_CSS.htm</strong>，並且將 表格 &lt;table <strong>class=&quot;datatable&quot;</strong>&gt;<br />
        加到<strong> GridView 的「CssClass」屬性裡</strong>面</span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            onrowdatabound="GridView1_RowDataBound" 
            Caption="GridView的Caption屬性" CssClass="datatable">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title], [author] FROM [test]"></asp:SqlDataSource>
        <br />
    </div>
    </form>

</body>
</html>
