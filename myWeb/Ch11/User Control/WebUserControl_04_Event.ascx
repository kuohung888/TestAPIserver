<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl_04_Event.ascx.cs" Inherits="WebUserControl_04_Event" %>

<style type="text/css">
    .style1
    {
        color: #FF0000;
        font-weight: bold;
    }
</style>

<h3>事件內，暫時「不」使用參數</h3>

<asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
    BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" 
    DataSourceID="SqlDataSource1" GridLines="Horizontal" 
    EnableSortingAndPagingCallbacks="True" AllowPaging="True" PageSize="5">
    <AlternatingRowStyle BackColor="#F7F7F7" />
    <Columns>
        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
            ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="test_time" HeaderText="test_time" 
            SortExpression="test_time" />
        <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="summary" HeaderText="summary" 
            SortExpression="summary" />
    </Columns>
    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <SortedAscendingCellStyle BackColor="#F4F4FD" />
    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
    <SortedDescendingCellStyle BackColor="#D8D8F0" />
    <SortedDescendingHeaderStyle BackColor="#3E3277" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    SelectCommand="SELECT * FROM [test]" 
    UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author, [hit_no] = @hit_no, [get_no] = @get_no, [email_no] = @email_no, [approved] = @approved WHERE [id] = @id">
    <UpdateParameters>
        <asp:Parameter Name="test_time" Type="DateTime" />
        <asp:Parameter Name="class" Type="String" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="summary" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<p class="style1">
    自訂事件</p>
<p>
    預設GridView是分頁的，每頁有五筆紀錄。 AllowPaging=&quot;True&quot;</p>
