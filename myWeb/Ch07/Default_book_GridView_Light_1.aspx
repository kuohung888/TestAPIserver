<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView_Light_1.aspx.cs" Inherits="Book_Sample_Ch07_Default_book_GridView_Light_1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 光棒功能！#2 </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        光棒功能！#2<br />
        使用者點選某一列，那一列就會改變底色（看起來，比較明顯）<br />

        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id"
            DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="5">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time日期" DataFormatString="{0:yyyy/MM/dd}" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title標題" SortExpression="title" />
                <asp:BoundField DataField="summary" HeaderText="summary摘要" SortExpression="summary" />
            </Columns>
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT [id], [test_time], [title], [summary] FROM [test]" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [summary]) VALUES (@test_time, @title, @summary)" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [summary] = @summary WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

    </div>
    </form>
 
 
</body>
</html>
