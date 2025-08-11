<%@ Page Language="C#" Title="員工查詢" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeQuery.aspx.cs" Inherits="employee.EmployeeQuery" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>員工查詢</h2>
    <asp:Panel ID="pnlQuery" runat="server" CssClass="panel">
        <table>
            <tr>
                <td>姓名：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" />
                </td>
                <td>部門：</td>
                <td>
                    <asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="true">
                     
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="btnQuery" runat="server" Text="查詢" OnClick="btnQuery_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:GridView ID="gvResult" runat="server" AutoGenerateColumns="False" EmptyDataText="查無資料" Width="100%"  CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="EmployeeID" HeaderText="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="Position" HeaderText="Position" />
            <asp:BoundField DataField="Department" HeaderText="Department" />
            <asp:BoundField DataField="HireDate" HeaderText="Hire Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Salary" HeaderText="Salary" DataFormatString="{0:N0}" />
        </Columns>
    </asp:GridView>
</asp:Content>