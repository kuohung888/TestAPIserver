<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manual_Set_Width_1.aspx.cs" Inherits="Book_Sample_Ch10_Manual_Set_Width_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>以動態方式設定 GridView控制項的資料行寬度 #1</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        請輸入 GridView每一欄（行）的「寬度」：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        （單位px）<asp:Button ID="Button1" runat="server" Text="Button" 
            onclick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" 
                    SortExpression="summary" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 5 [id], [title], [summary] FROM [test]">
        </asp:SqlDataSource>
    
        <br />
        <asp:Label ID="Label1" runat="server" style="color: #FF0000"></asp:Label>
    
    </div>
    </form>
</body>
</html>
