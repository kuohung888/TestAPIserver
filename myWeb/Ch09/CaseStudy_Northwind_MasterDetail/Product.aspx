<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Book_Sample_CaseStudy_Northwind_MasterDetail_Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #009900;
            font-weight: bold;
            background-color: #99FF99;
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
        <span class="style1">產品（Product）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><a href="Default_0.aspx">回到首頁</a></b><br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Horizontal" Height="50px" Width="640px">
            <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ProductID">
                <ItemStyle Font-Bold="True" Font-Size="Large" ForeColor="#009900" />
                </asp:BoundField>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" 
                    SortExpression="ProductName" />
                <asp:TemplateField HeaderText="SupplierID">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("SupplierID", "Supplier.aspx?SupplierID={0}") %>' 
                            Text='<%# Eval("SupplierID") %>'></asp:HyperLink>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="CompanyName" 
                            DataValueField="SupplierID" SelectedValue='<%# Bind("SupplierID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                            SelectCommand="SELECT [SupplierID], [CompanyName] FROM [Suppliers]">
                        </asp:SqlDataSource>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="True" />
                </asp:TemplateField>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" 
                    SortExpression="CategoryID" />
                <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" 
                    SortExpression="QuantityPerUnit" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" 
                    SortExpression="UnitsInStock" />
                <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" 
                    SortExpression="UnitsOnOrder" />
                <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" 
                    SortExpression="ReorderLevel" />
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" 
                    SortExpression="Discontinued" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="40" Name="ProductID" 
                    QueryStringField="ProductID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

