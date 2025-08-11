<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1_DropDownList_Error.aspx.cs" Inherits="Book_Sample_Ch09_DataBinding_Error_1_DropDownList_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>錯誤版</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        類似蘋果日報的功能：<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="title" DataValueField="id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT [id], [title] FROM [test]"></asp:SqlDataSource>
&nbsp; (AutoPostBack = true)<br />
        <br />
        <br />
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" GridLines="Horizontal" Height="50px" Width="555px">
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title">
                <ItemStyle BackColor="#CCFFCC" Font-Size="Large" ForeColor="#006600" />
                </asp:BoundField>
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
                <asp:BoundField DataField="article" HeaderText="article" SortExpression="article" />
                <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" DeleteCommand="DELETE FROM [test] WHERE [id] = @id" InsertCommand="INSERT INTO [test] ([test_time], [title], [summary], [article], [author]) VALUES (@test_time, @title, @summary, @article, @author)" SelectCommand="SELECT [id], [test_time], [title], [summary], [article], [author] FROM [test]" UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title, [summary] = @summary, [article] = @article, [author] = @author WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="test_time" Type="DateTime" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="summary" Type="String" />
                <asp:Parameter Name="article" Type="String" />
                <asp:Parameter Name="author" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
    <p>
        錯誤步驟：<strong>當您進行「編輯（更新）」文章的標題（title）之後，</strong></p>
    <p>
        <strong>上方的 DropDownList裡面的文章標題，仍然保留「舊的標題」，該怎麼辦？</strong></p>
</body>
</html>
