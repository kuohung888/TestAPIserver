<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Northwind_Order_2_Join.aspx.cs" Inherits="Book_Sample_Ch09_Northwind_Order_2_Join" %>

<!DOCTYPE html>

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
            background-color: #0000CC;
        }
        .style3
        {
            color: #0000FF;
        }
        .style4
        {
            background-color: #FFFF66;
        }
        .style5
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        北風貿易資料庫的「訂單」<span class="style1"><strong><span class="style2">SQL指令--Join</span></strong></span><br />
        <br />
        Order與 Order Detail兩個關聯資料表，透過<strong> OrderID欄位</strong>來串在一起。<br />
        <span class="style3"><strong>自己修改 SQL指令，使用 Join串連其他資料表。<br />
        </strong></span>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Height="50px" 
            Width="640px">
            <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
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
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
            <RowStyle BackColor="White" ForeColor="#003399" />
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
        Order Detail<span class="style3"><strong>&nbsp;&nbsp;&nbsp; （雙 Primary 
        Key）</strong></span></p>
    <p>
        <span class="style3"><strong>自己修改 SQL指令，使用 Join串連其他資料表。<br />
        <br />
        Select <span class="style4">B.*</span>, <span class="style4">C.ProductName </span></span> <span class="style4">
        <span class="style5">As ProductName</span></span><span class="style3"> 
        From [Orders] A, [order details] B, [Products] C
        <br />
        Where A.OrderID = B.OrderID and B.ProductID = C.ProductID and 
        <span class="style4">A.OrderID = &#39;10248&#39;</span></span></strong></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource2" 
            Width="640px">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" 
                    SortExpression="ProductID" />

                <asp:BoundField DataField="ProductName" HeaderText="ProductName（自己動手加入此欄位，源自 Product Table）" 
                    SortExpression="ProductName" >
                        <ItemStyle BackColor="#CCFFFF" />
                </asp:BoundField>

                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle ForeColor="#003399" HorizontalAlign="Left" BackColor="#99CCCC" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString_Windows %>" 
            SelectCommand="Select B.*, C.ProductName As ProductName From [Orders] A, [order details] B, [Products] C
                                     Where A.OrderID = B.OrderID and B.ProductID = C.ProductID and A.OrderID = @OrderID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="OrderID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </form>
</body>
</html>

