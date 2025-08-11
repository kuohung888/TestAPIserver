<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_B.ascx.cs" Inherits="UC_B" %>

    <br />
    <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="SqlDataSource1" PageSize="5">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary" 
                    SortExpression="summary" />
            </Columns>
            <EmptyDataTemplate>
                Sorry...No Record!
            </EmptyDataTemplate>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title], [summary] FROM [test] WHERE ([title] LIKE '%' + @title + '%')">
            <SelectParameters>
                <asp:SessionParameter Name="title" SessionField="u_title" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>