<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_8.aspx.cs" Inherits="Ch04_Validator_V_8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ValidationSummary<br />
        <br />
        欄位一：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="TextBox1" ErrorMessage="1.不可留白！RequiredFieldValidator"></asp:RequiredFieldValidator>
        <br />
        欄位二：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
            ControlToValidate="TextBox2" ErrorMessage="2.不可留白！RequiredFieldValidator"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            ShowMessageBox="True" />

    </div>
    </form>

</body>
</html>
