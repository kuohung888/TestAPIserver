<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_UserControl_1.ascx.cs" Inherits="Ch11_Default_book_4_UserControl_1" %>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            AutoGenerateSelectButton="True" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" 
            DataSourceID="SqlDataSource_UC" ForeColor="Black" GridLines="None" 
            AllowPaging="True" AllowSorting="True" Font-Size="Small" PageSize="5">
            <FooterStyle BackColor="Tan" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title（標題）" SortExpression="title">
                    <ItemStyle Font-Bold="True" Font-Size="Medium" ForeColor="Maroon" />
                </asp:BoundField>
                <asp:BoundField DataField="class" HeaderText="class（分類）" 
                    SortExpression="class" />
                <asp:BoundField DataField="author" HeaderText="author（作者）" 
                    SortExpression="author" />
            </Columns>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource_UC" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title], [class], [author] FROM [test]">
        </asp:SqlDataSource>