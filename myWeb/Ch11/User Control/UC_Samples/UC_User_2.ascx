<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_User_2.ascx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_UC_User_2" %>


<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" 
    GridLines="None" PageSize="5">
    <RowStyle BackColor="#E3EAEB" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
            ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="test_time" HeaderText="test_time" 
            SortExpression="test_time" />
        <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
        <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
        <asp:BoundField DataField="summary" HeaderText="summary" 
            SortExpression="summary" />
        <asp:BoundField DataField="article" HeaderText="article" 
            SortExpression="article" />
        <asp:BoundField DataField="author" HeaderText="author" 
            SortExpression="author" />
        <asp:BoundField DataField="get_no" HeaderText="get_no" 
            SortExpression="get_no" />
        <asp:BoundField DataField="email_no" HeaderText="email_no" 
            SortExpression="email_no" />
        <asp:BoundField DataField="hit_no" HeaderText="hit_no" 
            SortExpression="hit_no" />
        <asp:BoundField DataField="approved" HeaderText="approved" 
            SortExpression="approved" />
    </Columns>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#7C6F57" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
    SelectCommand="SELECT * FROM [test]" 
    UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [class] = @class, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author, [get_no] = @get_no, [email_no] = @email_no, [hit_no] = @hit_no, [approved] = @approved WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="test_time" Type="DateTime" />
        <asp:Parameter Name="class" Type="String" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="summary" Type="String" />
        <asp:Parameter Name="article" Type="String" />
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="get_no" Type="Int32" />
        <asp:Parameter Name="email_no" Type="Int32" />
        <asp:Parameter Name="hit_no" Type="Int32" />
        <asp:Parameter Name="approved" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>