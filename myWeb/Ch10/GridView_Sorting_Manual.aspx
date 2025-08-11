<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Sorting_Manual.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Sorting_Manual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>排序 / Sorting（自己動手寫）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style3
        {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        要撰寫 GridView的排序功能（Sorting），先要瞭解這兩個參數 -- <span class="style1">SortExpression</span> 
        與 <span class="style2">SortDirection</span><br />
        這兩個參數除在不同的事件裡面，有不同的用法。
    </p>
    <p>
        <span class="style3">仍採用現成的 SqlDataSource來作，只是自己手動撰寫 GridView的 Sorting()事件</span></p>
    <p>
        e.SortDirection :
        <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
    </p>
    <p>
        e.SortExpression :
        <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox>
    </p>
    <p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" PageSize="5" onsorted="GridView1_Sorted" 
            onsorting="GridView1_Sorting">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" 
                    SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" 
                    SortExpression="author" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [test_time], [title], [author] FROM [test]">
        </asp:SqlDataSource>
    </p>
    <div>
    
        <asp:Label ID="Label1" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
