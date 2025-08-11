<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_2_RowCreated_Difference.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowCreated_RowDataBound_0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        RowCreated事件&nbsp; V.S.&nbsp; RowDataBound事件，兩者差異？<br />
        <br />
        第一，RowCreated事件，較早執行！<br />
        <br />
        第二，<span class="auto-style1">RowCreated事件內，DataBinding的<strong>欄位值（文字），尚未出現</strong></span>。請看後置程式碼。<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 把 <strong>e.Row.Cells[1].Text的文字</strong>抓出來看看，您就清楚了。我用「文字<strong>長度</strong>」來測量<br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" PageSize="5">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
