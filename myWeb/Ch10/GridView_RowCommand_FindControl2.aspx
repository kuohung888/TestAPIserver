<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowCommand_FindControl2.aspx.cs" Inherits="Book_Sample_Ch10_GridView_RowCommand_FindControl2" %>

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
    
        源自msdn網站的範例 <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx</a><br />
        <br />
        Gridview <strong>RowCommand事件</strong>裡面 e.CommandSource / e.CommandName / e.CommandArgument怎麼用？<br />
        <br />
        <br />
        作法：<br />
        這裡的按鈕 (LinkButton）是採用 <span class="auto-style1"><strong>GridView本身的「ButtonField」</strong></span>。<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="5" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated">
            <Columns>
                
                <asp:ButtonField buttontype="Link" CommandName="Add" Text="Add(按鈕，有CommandName)" HeaderText="GridView的 ButtonField">

                <ItemStyle BackColor="#FFCCFF" />
                </asp:ButtonField>

                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
    <asp:listbox id="ListBox1" runat="server"/>

    </div>
    </form>
</body>
</html>
