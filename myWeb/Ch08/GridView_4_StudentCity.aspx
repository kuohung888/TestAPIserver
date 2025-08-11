<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_4_StudentCity.aspx.cs" Inherits="Book_Sample_Ch08_GridView_4_StudentCity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <strong>兩個資料表</strong><br />
            <br />
            基礎資料，例如學生出生地（籍貫），通常會獨自做一個Table來記錄。<br />
            例如 <strong>student_city資料表</strong>，裡面記錄了全台灣各縣市。<br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
                    <asp:TemplateField HeaderText="city" SortExpression="city">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("city") %>' Style="color: #FF0000; font-weight: 700"></asp:Label>
                            <br />
                            <br />
                            搭配地址資料表（student_city）<br />
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="city" DataValueField="city" Enabled="False" SelectedValue='<%# Bind("city") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                                SelectCommand="SELECT [id], [city] FROM [student_city]"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="chinese" HeaderText="chinese" SortExpression="chinese" />
                    <asp:BoundField DataField="math" HeaderText="math" SortExpression="math" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>" SelectCommand="SELECT * FROM [student_test]"></asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
