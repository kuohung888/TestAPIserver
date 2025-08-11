<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_3_DropDownList.aspx.cs" Inherits="Book_Sample_Ch08_GridView_3_DropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        使用 <span class="style1"><strong>student_test資料表</strong></span>來作<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="id">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="student_id" HeaderText="student_id" 
                    SortExpression="student_id" />

                <asp:TemplateField HeaderText="city" SortExpression="city">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="city" DataValueField="city" 
                            SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
                            SelectCommand="SELECT DISTINCT [city] FROM [student_test]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="city" DataValueField="city" 
                            SelectedValue='<%# Bind("city") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
                            SelectCommand="SELECT DISTINCT [city] FROM [student_test]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="chinese" HeaderText="chinese" 
                    SortExpression="chinese" />
                <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            DeleteCommand="DELETE FROM [student_test] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [student_test] ([name], [student_id], [city], [chinese], [math]) VALUES (@name, @student_id, @city, @chinese, @math)" 
            SelectCommand="SELECT * FROM [student_test]" 
            UpdateCommand="UPDATE [student_test] SET [name] = @name, [student_id] = @student_id, [city] = @city, [chinese] = @chinese, [math] = @math WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="chinese" Type="Int32" />
                <asp:Parameter Name="math" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="student_id" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="chinese" Type="Int32" />
                <asp:Parameter Name="math" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

