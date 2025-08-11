<%@ Page Language="C#"  Title="新增員工" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="employee.AddEmployee" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>新增員工</h2>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:Panel ID="pnlForm" runat="server">
        <table>
            <tr>
                <td>First Name：</td>
                <td><asp:TextBox ID="txtFirstName" runat="server" /></td>
            </tr>
            <tr>
                <td>Last Name：</td>
                <td><asp:TextBox ID="txtLastName" runat="server" /></td>
            </tr>
            <tr>
                <td>Position：</td>
                <td><asp:TextBox ID="txtPosition" runat="server" /></td>
            </tr>
            <tr>
                <td>Department：</td>
                <td><asp:TextBox ID="txtDepartment" runat="server" /></td>
            </tr>
            <tr>
                <td>Hire Date：</td>
                <td><asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" /></td>
            </tr>
            <tr>
                <td>Salary：</td>
                <td><asp:TextBox ID="txtSalary" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right">
                    <asp:Button ID="btnSubmit" runat="server" Text="新增" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="取消" PostBackUrl="~/Default.aspx" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

