<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_1_RowIndex.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_1_RowIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br /><br />
        GridView的 <span class="style1">RowDataBound事件 #1-- RowIndex的用法</span></div>
        <br />
        <strong>RowIndex</strong>從 &quot;零&quot;算起，只會存在「DataRow」裡面！<br />
        <br />
        <br />
        <b>GridView裡面，只列出五筆記錄<br />
        </b>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [title], [test_time] FROM [test]">
        </asp:SqlDataSource>
    </form>
</body>
</html>
