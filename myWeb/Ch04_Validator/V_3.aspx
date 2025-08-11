<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_3.aspx.cs" Inherits="Ch04_Validator_V_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        請輸入一個數字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        （務必大於一百）<br />
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="CompareValidator，錯誤！務必大於一百！" 
            Operator="GreaterThan" Type="Integer" ValueToCompare="100"></asp:CompareValidator>
    
    </div>
    </form>
 
</body>
</html>
