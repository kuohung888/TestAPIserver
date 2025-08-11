<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_1.aspx.cs" Inherits="Ch04_Validator_V_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>RequiredField(必填欄位)</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        RequiredField(必填欄位)<br />
        <br /><br /><br />
        請輸入任何文字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator，不可留空白！" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    
    </div>
    </form>
 
</body>
</html>

