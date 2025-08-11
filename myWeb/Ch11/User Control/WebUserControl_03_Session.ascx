<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl_03_Session.ascx.cs" Inherits="Book_Sample_User_Control_WebUserControl_03_Session" %>


<style type="text/css">
    .style1
    {
        color: #FF0000;
        font-weight: bold;
    }
</style>

<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
    DataSourceID="SqlDataSource1" GridLines="None" ForeColor="#333333">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
            ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="test_time" HeaderText="test_time" 
            SortExpression="test_time" />
        <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="author" HeaderText="author" 
            SortExpression="author" />
    </Columns>
    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    SelectCommand="SELECT [id], [test_time], [class], [title], [author] FROM [test]">
</asp:SqlDataSource>
<p>
    &nbsp;</p>
<p>
    預設GridView是分頁的，每頁有<span class="style1">五筆</span>紀錄。 AllowPaging=&quot;True&quot;</p>
