<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Book_Sample_CaseStudy_Northwind_MasterDetail_Supplier" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            color: #0000CC;
            font-weight: bold;
            background-color: #99CCFF;
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
        <span class="style1">產品供應商（Supplier）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><a href="Default_0.aspx">回到首頁</a></b><br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="SupplierID" DataSourceID="SqlDataSource1" 
            GridLines="Horizontal" Height="50px" Width="640px">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="SupplierID">
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
                <asp:BoundField DataField="HomePage" HeaderText="HomePage" 
                    SortExpression="HomePage" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Suppliers] WHERE ([SupplierID] = @SupplierID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="19" Name="SupplierID" 
                    QueryStringField="SupplierID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

