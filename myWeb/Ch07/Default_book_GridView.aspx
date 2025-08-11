<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_GridView.aspx.cs" Inherits="Ch07_Default_book_GridView" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id"
            DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="5">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="test_time" HeaderText="test_time日期" DataFormatString="{0:yyyy/MM/dd}" SortExpression="test_time" />
                <asp:BoundField DataField="title" HeaderText="title標題" SortExpression="title" />
                <asp:TemplateField HeaderText="summary摘要" SortExpression="summary">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="100px" Text='<%# Bind("summary") %>'
                            TextMode="MultiLine" Width="350px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        摘要內容----<br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("summary") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
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
