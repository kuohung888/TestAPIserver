<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Northwind_Order_3_Join.aspx.cs" Inherits="Book_Sample_Ch09_Northwind_Order_3_Join" %>

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
            background-color: #009900;
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
            color: #009900;
        }
        .style6
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
        <strong>
        <span class="style5">自己修改 SQL指令，使用 Join串連其他資料表。<br />
        <br />
        修改一下 DetailView樣板，讓畫面更好看。</span><span class="style3"><br />
        </span>
        </strong>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="OrderID" DataSourceID="SqlDataSource1" Height="50px" 
            Width="640px" ForeColor="Black" GridLines="Horizontal">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:TemplateField HeaderText="CustomerID" SortExpression="CustomerID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                        <br />  
                        <!-- 重點！！ 客戶名稱 -->
                        <asp:Label ID="Label4" runat="server" style="font-weight: 700; color: #CC0099" 
                            Text='<%# Bind("CustName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EmployeeID" SortExpression="EmployeeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                        <br />  
                        <!-- 重點！！ 我方員工（業務）名稱 -->
                        <asp:Label ID="Label5" runat="server" style="font-weight: 700; color: #CC0099" 
                            Text='<%# Bind("FirstName") %>'></asp:Label>
                        <asp:Label ID="Label6" runat="server" style="font-weight: 700; color: #CC0099" 
                            Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                    SortExpression="OrderDate" />
                <asp:BoundField DataField="RequiredDate" HeaderText="RequiredDate" 
                    SortExpression="RequiredDate" />
                <asp:BoundField DataField="ShippedDate" HeaderText="ShippedDate" 
                    SortExpression="ShippedDate" />
                <asp:TemplateField HeaderText="ShipVia" SortExpression="ShipVia">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ShipVia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ShipVia") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShipVia") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" 
            InsertCommand="INSERT INTO [Orders] ([CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [ShipVia], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)" 
            SelectCommand="Select A.*, B.CompanyName As CustName, C.LastName As LastName, C.FirstName As FirstName 
                                    From [Orders] A, [Customers] B, [Employees] C 
                                    Where A.CustomerID = B.CustomerID and A.EmployeeID = C.EmployeeID" 
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
        Order Detail&nbsp;&nbsp;&nbsp; </span>
        <span class="style5">（雙 Primary Key）</span></strong></p>
    <p class="style5">
        <strong>自己修改 SQL指令，使用 Join串連其他資料表。<br />
        <br />
        Select <span class="style4">B.*</span>, <span class="style4">C.ProductName
        <span class="style6">As ProductName</span></span> 
        From [Orders] A, [order details] B, [Products] C
        <br />
        Where A.OrderID = B.OrderID and B.ProductID = C.ProductID and 
        <span class="style4">A.OrderID = &#39;10248&#39;</span></strong></p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="OrderID,ProductID" DataSourceID="SqlDataSource2" 
            Width="640px" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                    SortExpression="OrderID" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" 
                    SortExpression="ProductID" />

                <asp:BoundField DataField="ProductName" HeaderText="ProductName（自己動手加入此欄位，源自 Product Table）" 
                    SortExpression="ProductName" >
                        <ItemStyle BackColor="#99FF99" />
                </asp:BoundField>

                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />
                <asp:BoundField DataField="Discount" HeaderText="Discount" 
                    SortExpression="Discount" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
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


