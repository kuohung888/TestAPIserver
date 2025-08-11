<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_SubString_RowDataBound.aspx.cs" Inherits="Book_Sample_Ch11_GridView_SubString_RowDataBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FF9999;
        }
        .auto-style2 {
            background-color: #FFCC66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        欄位的字太長，怎麼辦？<br />
        <br />
        利用 <strong><span class="auto-style1">.Substring()方法</span></strong>，搭配 GridView的 <strong><span class="auto-style2">RowDatabound事件</span></strong>來處理。<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" DataFormatString="{0:yyyy/MM/dd}" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
