<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="GridView_Edit_DefaultValue.aspx.cs" Inherits="Book_Sample_Ch11_GridView_Edit_DefaultValue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        GridView進入編輯模式，給予預設值<br />
    </p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="test_time" HeaderText="test_time" SortExpression="test_time" />
                    <asp:TemplateField HeaderText="title" SortExpression="title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
                DeleteCommand="DELETE FROM [test] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [test] ([test_time], [title]) VALUES (@test_time, @title)" 
                SelectCommand="SELECT [id], [test_time], [title] FROM [test]" 
                UpdateCommand="UPDATE [test] SET [test_time] = @test_time, [title] = @title WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="test_time" Type="DateTime" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
