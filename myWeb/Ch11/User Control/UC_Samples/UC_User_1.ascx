<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_User_1.ascx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_UC_User_1" %>


<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
    Height="50px" Width="125px">
    <Fields>
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
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
    InsertCommand="INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author], [get_no], [email_no], [hit_no], [approved]) VALUES (@test_time, @class, @title, @summary, @article, @author, @get_no, @email_no, @hit_no, @approved)" >

    <InsertParameters>
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
    </InsertParameters>
</asp:SqlDataSource>