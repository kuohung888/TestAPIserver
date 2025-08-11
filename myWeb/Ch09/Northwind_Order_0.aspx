<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Northwind_Order_0.aspx.cs" Inherits="Book_Sample_Ch09_Northwind_Order_0" %>

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
            background-color: #CC0000;
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
    
        北風貿易資料庫的「訂單」<span class="style1"><strong><span class="style2">原始版</span></strong></span><br />
        <br />
        Order與 Order Detail兩個關聯資料表，透過<strong> OrderID欄位</strong>來串在一起。<br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Height="50px" 
            Width="640px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    SortExpression="EmployeeID" />
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
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
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
            AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource2" 
            Width="640px">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" >
                <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" 
                    SortExpression="ProductID" >
                <ItemStyle BackColor="#FFCC99" />
                </asp:BoundField>
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
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
