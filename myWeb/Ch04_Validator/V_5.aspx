<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="V_5.aspx.cs" Inherits="Ch04_Validator_V_5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        公式驗證</p>
    <p>
        請輸入您的E-Mail：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    </p>
    <div>
    

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox1" Display="Dynamic" 
            ErrorMessage="RegularExpressionValidator。您的E-Mail格式不對！" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator，資料不可留白！" ForeColor="#CC3300" style="font-weight: 700"></asp:RequiredFieldValidator>
    
    

    </div>
    <br />
    </form>
 
</body>
</html>
