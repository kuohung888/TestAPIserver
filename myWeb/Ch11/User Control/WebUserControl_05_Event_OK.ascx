<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl_05_Event_OK.ascx.cs" Inherits="WebUserControl_05_Event_OK" %>


<style type="text/css">
    .style1
    {
        color: #FF0000;
        font-weight: bold;
    }
</style>

<h3>事件內，「使用」參數</h3>

<asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
    DataSourceID="SqlDataSource1" GridLines="None" 
    EnableSortingAndPagingCallbacks="True" AllowPaging="True" PageSize="5" 
    ForeColor="#333333" onrowediting="GridView1_RowEditing">
    <AlternatingRowStyle BackColor="White" />
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
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    SelectCommand="SELECT * FROM [test]" 
    UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary WHERE [id] = @id">
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
