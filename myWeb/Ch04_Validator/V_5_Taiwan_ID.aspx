<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_5_Taiwan_ID.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_5_Taiwan_ID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        台灣的身份證字號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="驗證錯誤！RegularExpressionValidator" ForeColor="Red" ValidationExpression="[A-Z]{1}[0-9]{9}"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        驗證規則&nbsp;&nbsp; [A-Z]{1}[0-9]{9}</p>
</body>
</html>
