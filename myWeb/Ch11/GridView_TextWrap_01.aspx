<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_TextWrap_01.aspx.cs" Inherits="Book_Sample_Ch11_GridView_TextWrap_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        文字過長，自動換列（文字換列）<br />
        <br />
        針對英文字也有效。<br />
        <br />
        <br />
        <br />
        <br />
        1. 先設定 title欄位的<strong>寬度為150px</strong><br />
        <br />
        2. 撰寫 GridView的 <strong><span class="auto-style1">RowDataBound事件，針對「每一列」加入CSS。</span></strong><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" >
                <ItemStyle ForeColor="#CC0066" Width="150px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>

        <br />

    </div>
    </form>
</body>
</html>
