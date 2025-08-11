<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl_01.ascx.cs" Inherits="Book_Sample_User_Control_WebUserControl_01" %>

<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
    AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
    BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" 
    DataSourceID="SqlDataSource1" GridLines="Horizontal" 
    EnableSortingAndPagingCallbacks="True">
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
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    SelectCommand="SELECT [id], [test_time], [class], [title], [author] FROM [test]">
</asp:SqlDataSource>
<p>
    &nbsp;</p>
<p>
    預設GridView是分頁的，每頁有五筆紀錄。 AllowPaging=&quot;True&quot;</p>