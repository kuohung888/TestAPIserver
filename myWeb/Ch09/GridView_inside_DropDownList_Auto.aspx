<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_inside_DropDownList_Auto.aspx.cs" Inherits="Ch09_GridView_inside_DropDownList_Auto" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>不寫程式，</b>完全依賴現成的SqlDataSource<br />
        <hr />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id"
            GridLines="Horizontal" PageSize="5" DataSourceID="SqlDataSource1"
            AllowSorting="True">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False"
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="real_name" HeaderText="real_name"
                    SortExpression="real_name" />

                <asp:TemplateField HeaderText="sex" SortExpression="sex">
                    <EditItemTemplate>

                        <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                            SelectedValue='<%# Bind("sex") %>'>
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"
                            Text='<%# Eval("sex") %>'></asp:Label>

                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("sex") %>'
                            Style="font-weight: 700; color: #FF0000"></asp:Label>
                        &nbsp;
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                            SelectedValue='<%# Bind("sex") %>'>
                            <asp:ListItem>男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#CCFFCC" ForeColor="#006600" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            InsertCommand="INSERT INTO [db_user] ([real_name], [sex]) VALUES (@real_name, @sex)"
            SelectCommand="SELECT [id], [real_name], [sex] FROM [db_user]"
            UpdateCommand="UPDATE [db_user] SET [real_name] = @real_name, [sex] = @sex WHERE [id] = @id">
            <UpdateParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="real_name" Type="String" />
                <asp:Parameter Name="sex" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

    </div>
    </form>

</body>
</html>
