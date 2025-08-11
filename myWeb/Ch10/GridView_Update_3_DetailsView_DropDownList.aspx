<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Update_3_DetailsView_DropDownList.aspx.cs" Inherits="Book_Sample_Ch10_GridView_Update_3_DetailsView_DropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        北風資料庫的 Order Details資料表</p>
    <p>
        <strong>點選「產品」，會</strong><span class="auto-style1"><strong>自動帶出「單價」</strong></span><br />
    </p>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" Width="464px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text="10248"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductID" SortExpression="ProductID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>

                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="ProductName" DataValueField="ProductID" 
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("ProductID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products]"></asp:SqlDataSource>
                    
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Order Details] WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID" InsertCommand="INSERT INTO [Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)" SelectCommand="SELECT * FROM [Order Details]" UpdateCommand="UPDATE [Order Details] SET [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Discount] = @Discount WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Discount" Type="Single" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Discount" Type="Single" />
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
