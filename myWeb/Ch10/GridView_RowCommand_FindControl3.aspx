<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowCommand_FindControl3.aspx.cs" Inherits="Book_Sample_Ch10_GridView_RowCommand_FindControl3" %>

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
    
        <strong>[修改版，另一種作法]</strong> -- 延續第一個範例的作法 -- GridView_RowCommand_FindControl1.aspx
        <br />
        <br />
        <strong>修改第二個範例。</strong><br />
        <br />
        源自msdn網站的範例 <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx</a><br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" PageSize="5" OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />

                <asp:TemplateField HeaderText="test_time (轉成樣板)" InsertVisible="False" SortExpression="test_time">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("test_time") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("test_time") %>'></asp:Label>
                        <asp:Button ID="Button1" runat="server" CommandName="Add" Text="Add(按鈕，有CommandName)" />
                    </ItemTemplate>
                    <ItemStyle BackColor="#CCFFCC" />
                </asp:TemplateField>

                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [test_time], [title] FROM [test]"></asp:SqlDataSource>
        <br />
        跟上一個範例(GridView_RowCommand_FindControl<b>2</b>.aspx)的差別：<br />
        <br />
        <strong>--本範例轉成"樣板"，然後加入一個Button按鈕。<br />
        --上一個範例則是加入「GridView的 <span class="auto-style1">ButtonField</span>」。導致後續寫法不同。</strong><br />
        <br />

        <asp:listbox id="ListBox1" runat="server"/>

    </div>
    </form>
</body>
</html>
