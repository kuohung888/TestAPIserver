<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Book_Sample_CaseStudy_Northwind_MasterDetail_Customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FF9966;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>NorthWind北風貿易資料庫</b><br />
        (仿造 .NET 4.0 Dynamic Data WebSite功能，用傳統作法來完成)<br />
        <br />
        <span class="style1">客戶（Customer）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>
        <a href="Default_0.aspx">回到首頁</a></b><br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2" DataKeyNames="CustomerID" 
            DataSourceID="SqlDataSource1" Height="50px" Width="640px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" 
                    SortExpression="CustomerID" >
                <ItemStyle Font-Bold="True" Font-Size="Large" ForeColor="Red" />
                </asp:BoundField>
                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" 
                    SortExpression="CompanyName" />
                <asp:BoundField DataField="ContactName" HeaderText="ContactName" 
                    SortExpression="ContactName" />
                <asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" 
                    SortExpression="ContactTitle" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Region" HeaderText="Region" 
                    SortExpression="Region" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" 
                    SortExpression="PostalCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="VINET" Name="CustomerID" 
                    QueryStringField="CustomerID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        這名客戶曾下過的訂單（Order）<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" DataKeyNames="OrderID" DataSourceID="SqlDataSource2" 
            Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    SortExpression="CustomerID" >
                <ItemStyle Font-Bold="True" Font-Size="Medium" ForeColor="Red" />
                </asp:BoundField>
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
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="CustomerID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

