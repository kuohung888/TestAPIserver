<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_2.aspx.cs" Inherits="Ch04_Validator_V_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        父親的年紀：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        歲</p>
    <p>
        孩子的年紀：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        歲</p>
    <p>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
            ErrorMessage="CompareValidator_不合理！孩子年紀比父親大？" Operator="LessThan" 
            Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    </p>
    <div>
    
        ============================================<br />
        別忘了這兩大屬性（初學者常犯錯）<br />
        <strong>Operator屬性<br />
        Type屬性（設定為整數，才能比較大小）</strong><br />
    
    </div>
    </form>
 
</body>
</html>
