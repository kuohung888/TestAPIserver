<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_NorthWind_Table2.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_NorthWind_Table2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        透過 Repeater來作北風資料庫的<strong>主表明細（Master-Detail）#2</strong><br />
        <br />
        Order資料表<br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table border="1" width="90%" id="table1">
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td colspan="8">
                        <b>OrderID : </b><big><b>
                            <%=Request("OrderID")%></b></big>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#99FF66">
                        <b>CustomerID :</b>
                    </td>
                    <td bgcolor="#99FF66">
                        <%# Eval("CustomerID")%><br />
                        <%# Eval("B_CompanyName")%>
                    </td>
                    <td bgcolor="#CCFFFF">
                        <b>EmployeeID : </b>
                    </td>
                    <td bgcolor="#CCFFFF">
                        <%# Eval("EmployeeID")%><br />
                        <%# Eval("C_LastName")%>
                    </td>
                    <td bgcolor="#CCCCFF">
                        <b>OrderDate : </b>
                    </td>
                    <td bgcolor="#CCCCFF">
                        <%# Eval("OrderDate", "{0:yyyy/MM/dd}")%>
                    </td>
                    <td bgcolor="#CCCCFF">
                        <b>RequiredDate : </b>
                    </td>
                    <td bgcolor="#CCCCFF">
                        <%# Eval("RequiredDate", "{0:yyyy/MM/dd}")%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShippedDate : </font></b>
                    </td>
                    <td colspan="7" bgcolor="#FFDDDD">
                        <%# Eval("ShippedDate", "{0:yyyy/MM/dd}")%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShipVia : </font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipVia")%><br />
                        <%# Eval("D_CompanyName")%>
                    </td>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">Freight : </font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("Freight")%>
                    </td>
                    <td bgcolor="#800000">
                        <font color="#FFFFFF"><b>ShipName :</b></font>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipName")%>
                    </td>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShipAddress :</font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipAddress")%>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShipCity : </font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipCity")%>
                    </td>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShipRegion : </font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipRegion")%>
                    </td>
                    <td bgcolor="#800000">
                        <font color="#FFFFFF"><b>ShipPostalCode :</b></font>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipPostalCode")%>
                    </td>
                    <td bgcolor="#800000">
                        <b><font color="#FFFFFF">ShipCountry : </font></b>
                    </td>
                    <td bgcolor="#FFDDDD">
                        <%# Eval("ShipCountry")%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString1 %>"
            SelectCommand="select A.*, B.CompanyName As B_CompanyName, C.LastName As C_LastName, D.CompanyName As D_CompanyName 
                                    from orders A, Customers B, Employees C, Shippers D
                                    where A.CustomerID = B.CustomerID And A.EmployeeID = C.EmployeeId And A.ShipVia = D.ShipperID And
                                     ([OrderID] = @OrderID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <hr />
        Order Details資料表<br />
        <hr />
        <br />
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <table border="1" width="90%" id="table1">
                    <tr>
                        <td rowspan="2" width="10%">
                            <b>流水號：</b><%# Container.ItemIndex + 1 %>
                        </td>
                        <td align="center" bgcolor="#C0C0C0" width="10%">
                            <b>ProductID</b>
                        </td>
                        <td align="center" bgcolor="#C0C0C0" width="50%">
                            <b>ProductName</b>
                        </td>
                        <td align="center" bgcolor="#800000" width="10%">
                            <font color="#FFFFFF"><b>UnitPrice</b></font>
                        </td>
                        <td align="center" bgcolor="#0000FF" width="10%">
                            <font color="#FFFFFF"><b>Quantity</b></font>
                        </td>
                        <td align="center" bgcolor="#008000" width="10%">
                            <font color="#FFFFFF"><b>Discount (%)</b></font>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#EEEEEE" width="10%">
                            <%# Eval("ProductID")%>
                        </td>
                        <td align="center" bgcolor="#EEEEEE" width="50%">
                            <%# Eval("ProductName")%>
                        </td>
                        <td align="center" bgcolor="#FFE6E6" width="10%">
                            <%# Eval("UnitPrice")%>
                        </td>
                        <td align="center" bgcolor="#DDDDFF" width="10%">
                            <%# Eval("Quantity")%>
                        </td>
                        <td align="center" bgcolor="#E1FFE1" width="10%">
                            <%# Eval("Discount")%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString1 %>"
            SelectCommand="Select A.*, B.ProductName As ProductName 
                                    From [Order Details] A, Products B
                                    Where A.ProductID = B.ProductID And ([OrderID] = @OrderID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        詳細的HTML表格，可以參閱<span class="style1"><strong>目錄「Repeater_HTML_Sample」</strong></span>
    </p>
</body>
</html>
