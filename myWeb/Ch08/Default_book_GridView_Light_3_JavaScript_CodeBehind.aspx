<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_3_JavaScript_CodeBehind.aspx.cs" Inherits="Book_Sample_Ch07_Default_book_GridView_Light_3_JavaScript_CodeBehind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            background-color: #FFFF00;
        }
        .style2
        {
            color: #CC0000;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        動態加入「光棒效果」的 JavaScript程式到 GridView<span class="style3">每一列</span>裡面。<br />
        <b>使用GridView的 <span class="style1">RowDataBound事件</span></b><br />
        <br />
        類似的作法，也可以參閱<b>「上集」第八章</b>的<span class="style2">範例Default_book_GridView_Template_2.aspx</span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title"></asp:BoundField>
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [title], [author] FROM [test]"></asp:SqlDataSource>
        <br />
    </div>
    </form>
</body>
</html>
