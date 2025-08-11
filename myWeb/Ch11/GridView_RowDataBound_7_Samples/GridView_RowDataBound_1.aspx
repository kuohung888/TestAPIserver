<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_1.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
        .style2
        {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        GridView的 <span class="style1">RowDataBound事件 #1</span><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound(v=VS.100).aspx</span></a>
        <br />
        <br />
        您也可以參閱這個<b>範例</b>，瞭解 RowDataBound事件的原理。<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx">
        <span class="style2">
        http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx</span></a>
        <br />
        <br />
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
        <br />
    
    </div>
    </form>
</body>
</html>

