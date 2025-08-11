<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Book_Sample_CaseStudy_Northwind_MasterDetail_Employee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFFCC;
            background-color: #CC0066;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>NorthWind北風貿易資料庫</b><br />
        (仿造 .NET 4.0 Dynamic Data WebSite功能，用傳統作法來完成)<br />
        <br />
        <span class="style1">員工（Employee）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>
        <a href="Default_0.aspx">回到首頁</a></b><br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" GridLines="None" 
            Height="50px" Width="640px">
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="TitleOfCourtesy" 
                    SortExpression="TitleOfCourtesy" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                    SortExpression="BirthDate" />
                <asp:BoundField DataField="HireDate" HeaderText="HireDate" 
                    SortExpression="HireDate" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Region" HeaderText="Region" 
                    SortExpression="Region" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                    SortExpression="PostalCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" 
                    SortExpression="HomePhone" />
                <asp:BoundField DataField="Extension" HeaderText="Extension" 
                    SortExpression="Extension" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="ReportsTo" HeaderText="ReportsTo" 
                    SortExpression="ReportsTo" />
                <asp:TemplateField HeaderText="PhotoPath" SortExpression="PhotoPath">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PhotoPath") %>'></asp:Label>
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoPath") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" 
            InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath]) VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @PostalCode, @Country, @HomePhone, @Extension, @Photo, @Notes, @ReportsTo, @PhotoPath)" 
            SelectCommand="SELECT * FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)" 
            
            UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [TitleOfCourtesy] = @TitleOfCourtesy, [BirthDate] = @BirthDate, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Region] = @Region, [PostalCode] = @PostalCode, [Country] = @Country, [HomePhone] = @HomePhone, [Extension] = @Extension, [Photo] = @Photo, [Notes] = @Notes, [ReportsTo] = @ReportsTo, [PhotoPath] = @PhotoPath WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Region" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="Extension" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ReportsTo" Type="Int32" />
                <asp:Parameter Name="PhotoPath" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="EmployeeID" 
                    QueryStringField="EmployeeID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="TitleOfCourtesy" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="HireDate" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Region" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="HomePhone" Type="String" />
                <asp:Parameter Name="Extension" Type="String" />
                <asp:Parameter Name="Photo" Type="Object" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ReportsTo" Type="Int32" />
                <asp:Parameter Name="PhotoPath" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    <p>
        這位員工成交的訂單如下：</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
            CellSpacing="1" DataKeyNames="OrderID" DataSourceID="SqlDataSource2" 
            Font-Size="Small" GridLines="None" PageSize="5">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    SortExpression="EmployeeID">
                <ItemStyle Font-Bold="True" Font-Size="Medium" ForeColor="Red" />
                </asp:BoundField>
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
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Orders] WHERE ([EmployeeID] = @EmployeeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="EmployeeID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </form>
</body>
</html>
