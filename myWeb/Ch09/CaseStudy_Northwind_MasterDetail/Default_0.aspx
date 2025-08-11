<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_0.aspx.cs" Inherits="Book_Sample_CaseStudy_Northwind_MasterDetail_Default_0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .style2
        {
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>NorthWind北風貿易資料庫</b><br />
        (仿造 .NET 4.0 Dynamic Data WebSite功能，用傳統作法來完成)<br />
        <br />
        <br />
        訂單的<span class="style1">主表明細（Master-Detail）</span><br />
        <br />
        <span class="style2">Order</span><asp:GridView ID="GridView1" runat="server" 
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Font-Size="Small" 
            PageSize="5">
            <AlternatingRowStyle BackColor="#FFCCCC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" 
                    ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="CustomerID">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("CustomerID", "Customer.aspx?CustomerID={0}") %>' 
                            Text='<%# Eval("CustomerID") %>'></asp:HyperLink>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            DataSourceID="SqlDataSource1A" DataTextField="CompanyName" 
                            DataValueField="CustomerID" SelectedValue='<%# Bind("CustomerID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1A" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [CustomerID], [CompanyName] FROM [Customers]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EmployeeID">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("EmployeeID", "Employee.aspx?EmployeeID={0}") %>' 
                            Text='<%# Eval("EmployeeID") %>'></asp:HyperLink>
                        <br />
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource1B" DataTextField="FirstName" 
                            DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1B" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName] FROM [Employees]">
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            DataSourceID="SqlDataSource1C" DataTextField="LastName" 
                            DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1C" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [EmployeeID], [LastName] FROM [Employees]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="True" Font-Size="Medium" />
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
            </Columns>
            <HeaderStyle BackColor="#99CCFF" />
            <SelectedRowStyle BackColor="#CC0066" />
        </asp:GridView>
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
        <hr />
    <p>
        <b>Order_Detail 訂單明細</b></p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderID,ProductID" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" >
                <ItemStyle Font-Bold="True" ForeColor="Red" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="ProductID">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("ProductID", "Product.aspx?ProductID={0}") %>' 
                            Text='<%# Eval("ProductID") %>'></asp:HyperLink>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="ProductName" 
                            DataValueField="ProductID" SelectedValue='<%# Bind("ProductID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:TemplateField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            DeleteCommand="DELETE FROM [Order Details] WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID" 
            InsertCommand="INSERT INTO [Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)" 
            SelectCommand="SELECT * FROM [Order Details] WHERE ([OrderID] = @OrderID)" 
            UpdateCommand="UPDATE [Order Details] SET [UnitPrice] = @UnitPrice, [Quantity] = @Quantity, [Discount] = @Discount WHERE [OrderID] = @OrderID AND [ProductID] = @ProductID">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="OrderID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int16" />
                <asp:Parameter Name="Discount" Type="Single" />
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </form>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
