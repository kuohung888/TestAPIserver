<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_5_CSS_jQuery.aspx.cs" Inherits="Book_Sample_Ch11_Default_book_GridView_Light_5_CSS_jQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>[光棒]滑鼠指向變色的表格_CSS_jQuery</title>
    <style type="text/css">
        .style3  {
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

    <!-- *******************************************(start) -->
    <!--  以下是CSS的外觀！！ -->
    <style>
        .highlight {
            background-color:greenyellow;
        }
   </style>
    <script src="jquery-1.4.1.min.js"></script>
    <!-- *******************************************(end) -->

</head>
<body>
    <form id="form1" runat="server">
    <div>
        jQuery 加入「光棒效果」的 CSS 到 GridView<span class="style3">每一列</span>裡面。<br />
        <br />
        <br />
        <br />
        <span class="style2"><b>完全不寫後置程式碼，單純 jQuery</b></span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" >
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

    <script>
        $(function () {
            var myGridViewRow = $('tr', '#<%=GridView1.UniqueID%>');

            myGridViewRow.hover(
                function() {
                    $(this).addClass("highlight");
                },
                function () {
                    $(this).removeClass("highlight");
                }
                );
        });
    </script>

</body>
</html>
