<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_OptimisticConcurrency.aspx.cs" Inherits="Book_Sample_Ch07_GridView_OptimisticConcurrency" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        開放式並行存取 
        <br />
        Optimistic Concurrency
        <br />
        <a href="http://msdn.microsoft.com/zh-tw/library/aa0416cz(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/aa0416cz(v=vs.110).aspx</a>
        <br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @original_id AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL))" InsertCommand="INSERT INTO [test] ([title], [author]) VALUES (@title, @author)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [title], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [title] = @title, [author] = @author WHERE [id] = @original_id AND (([title] = @original_title) OR ([title] IS NULL AND @original_title IS NULL)) AND (([author] = @original_author) OR ([author] IS NULL AND @original_author IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_title" Type="String" />
                <asp:Parameter Name="original_author" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_title" Type="String" />
                <asp:Parameter Name="original_author" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    <p>
        請您同時開兩個瀏覽器，模擬兩個人「同時」修改「同一筆記錄」</p>
    <p>
        然後觀察情況。</p>
</body>
</html>
