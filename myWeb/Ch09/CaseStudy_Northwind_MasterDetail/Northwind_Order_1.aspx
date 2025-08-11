<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Northwind_Order_1.aspx.cs" Inherits="Book_Sample_Ch09_Northwind_Order_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            background-color: #666666;
        }
        .style3
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        北風貿易資料庫的「訂單」<span class="style1"><strong><span class="style2">樣板 
        + DataBinding（不用寫程式）版</span></strong></span><br />
        <br />
        Order與 Order Detail兩個關聯資料表，透過<strong> OrderID欄位</strong>來串在一起。<br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Height="50px" 
            Width="640px" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:TemplateField HeaderText="CustomerID（轉成「樣板」）" SortExpression="CustomerID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="CompanyName" 
                            DataValueField="CustomerID" SelectedValue='<%# Bind("CustomerID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
                            SelectCommand="SELECT [CustomerID], [CompanyName] FROM [Customers]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EmployeeID（轉成「樣板」）" SortExpression="EmployeeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            DataSourceID="SqlDataSource4" DataTextField="LastName" 
                            DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
                            SelectCommand="SELECT [EmployeeID], [LastName] FROM [Employees]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" 
                    SortExpression="RequiredDate" />
                <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" 
                    SortExpression="ShippedDate" />
                <asp:BoundField DataField="ShipVia" HeaderText="ShipVia" 
                    SortExpression="ShipVia" />
                <asp:BoundField DataField="Freight" HeaderText="Freight" 
                    SortExpression="Freight" />
                <asp:BoundField DataField="ShipName" HeaderText="ShipName" 
                    SortExpression="ShipName" />
                <asp:BoundField DataField="ShipAddress" HeaderText="ShipAddress" 
                    SortExpression="ShipAddress" />
                <asp:BoundField DataField="ShipCity" HeaderText="ShipCity" 
                    SortExpression="ShipCity" />
                <asp:BoundField DataField="ShipRegion" HeaderText="ShipRegion" 
                    SortExpression="ShipRegion" />
                <asp:BoundField DataField="ShipPostalCode" HeaderText="ShipPostalCode" 
                    SortExpression="ShipPostalCode" />
                <asp:BoundField DataField="ShipCountry" HeaderText="ShipCountry" 
                    SortExpression="ShipCountry" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" 
            InsertCommand="INSERT INTO [Orders] ([CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)" 
            SelectCommand="SELECT * FROM [Orders]" 
            UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [EmployeeID] = @EmployeeID, [OrderDate] = @OrderDate, [RequiredDate] = @RequiredDate, [ShippedDate] = @ShippedDate, [ShipVia] = @ShipVia, [Freight] = @Freight, [ShipName] = @ShipName, [ShipAddress] = @ShipAddress, [ShipCity] = @ShipCity, [ShipRegion] = @ShipRegion, [ShipPostalCode] = @ShipPostalCode, [ShipCountry] = @ShipCountry WHERE [OrderID] = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="RequiredDate" Type="DateTime" />
                <asp:Parameter Name="ShippedDate" Type="DateTime" />
                <asp:Parameter Name="ShipVia" Type="Int32" />
                <asp:Parameter Name="Freight" Type="Decimal" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
                <asp:Parameter Name="OrderDate" Type="DateTime" />
                <asp:Parameter Name="RequiredDate" Type="DateTime" />
                <asp:Parameter Name="ShippedDate" Type="DateTime" />
                <asp:Parameter Name="ShipVia" Type="Int32" />
                <asp:Parameter Name="Freight" Type="Decimal" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    <p>
        ================================================================================</p>
    <p>
        Order Detail&nbsp;&nbsp;&nbsp; <span class="style3"><strong>（雙 Primary 
        Key）</strong></span></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource2" 
            Width="640px" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" >
                <ItemStyle BackColor="#CCCCCC" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ProductID（轉成「樣板」）" SortExpression="ProductID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            DataSourceID="SqlDataSource5" DataTextField="ProductName" 
                            DataValueField="ProductID" SelectedValue='<%# Bind("ProductID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
                            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle BackColor="#CCCCCC" />
                </asp:TemplateField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Order Details] WHERE ([OrderID] = @OrderID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="OrderID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </form>
</body>
</html>

