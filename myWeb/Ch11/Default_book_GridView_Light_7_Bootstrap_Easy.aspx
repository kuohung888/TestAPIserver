<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_7_Bootstrap_Easy.aspx.cs" Inherits="Book_Sample_Ch11_Default_book_GridView_Light_6_CSS_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <title>[光棒]滑鼠指向變色的表格_Bootstrap</title>

    <script src="[Sample]Bootstrap_Table/Scripts/jquery-1.9.1.js"></script>
    <link rel="stylesheet" href="[Sample]Bootstrap_Table/Scripts/bootstrap.min.css">
    <script src="[Sample]Bootstrap_Table/Scripts/bootstrap320.min.js"></script>

</head>
<body>
    <h3>請參閱本章的 [Sample]Bootstrap_Table目錄</h3>
    <p>
        <br />
    </p>
    <p>
        請使用 GridView的 CssClass屬性 = &quot;table table-condensed table-striped table-hover&quot;</p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover" 
                DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
