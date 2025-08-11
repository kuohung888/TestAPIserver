<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_NorthWind_Table1.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_NorthWind_Table1" %>

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
        透過 Repeater來作北風資料庫的<strong>主表明細（Master-Detail）#1 </strong>
        <br />
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table border="1" width="90%" id="table2">
                    <tr>
                        <td align="center" bgcolor="#0000FF">
                            <font color="#FFFFFF"><b>OrderID</b></font>
                        </td>
                        <td align="center" bgcolor="#0000FF">
                            <font color="#FFFFFF"><b>CustomerID</b></font>
                        </td>
                        <td align="center" bgcolor="#0000FF">
                            <font color="#FFFFFF"><b>EmployeeID</b></font>
                        </td>
                        <td align="center" bgcolor="#0000FF">
                            <font color="#FFFFFF"><b>OrderDate</b></font>
                        </td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <a href="Repeater_NorthWind_Table2.aspx?OrderID=<%# Eval("OrderID")%>" target="_blank">
                            <big><b>
                                <%# Eval("OrderID")%></b></big> </a>
                    </td>
                    <td>
                        <%# Eval("CustomerID")%>
                        --
                        <%# Eval("B_CompanyName")%>
                    </td>
                    <td>
                        <%# Eval("EmployeeID")%>
                        --
                        <%# Eval("C_LastName")%>
                    </td>
                    <td>
                        <%# Eval("OrderDate", "{0:yyyy/MM/dd}")%>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td bgcolor="#CECEFF">
                        <a href="Repeater_NorthWind_Table2.aspx?OrderID=<%# Eval("OrderID")%>" target="_blank">
                            <big><b>
                                <%# Eval("OrderID")%></b></big> </a>
                    </td>
                    <td bgcolor="#CECEFF">
                        <%# Eval("CustomerID")%>
                        --
                        <%# Eval("B_CompanyName")%>
                    </td>
                    <td bgcolor="#CECEFF">
                        <%# Eval("EmployeeID")%>
                        --
                        <%# Eval("C_LastName")%>
                    </td>
                    <td bgcolor="#CECEFF">
                        <%# Eval("OrderDate", "{0:yyyy/MM/dd}")%>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString1 %>"
            SelectCommand="select A.*, B.CompanyName As B_CompanyName, C.LastName As C_LastName
                                    from orders A, Customers B, Employees C
                                    where A.CustomerID = B.CustomerID And A.EmployeeID = C.EmployeeId"></asp:SqlDataSource>
        <br />
        <br />
        詳細的HTML表格，可以參閱<span class="style1"><strong>目錄「Repeater_HTML_Sample」</strong></span><br />
    </div>
    </form>
</body>
</html>
