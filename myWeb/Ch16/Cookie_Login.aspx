<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_Login.aspx.cs" Inherits="Ch16_Cookie_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cookie用在會員登入的身分檢查</title>
    <style type="text/css">
        .style1
        {
            color: #003399;
        }
        .style2
        {
            color: #003399;
            font-weight: bold;
            background-color: #FF99FF;
        }
    </style>
</head>
<body>
    <p>
        <span class="style2">[Cookie]</span><br class="style1" />
        <span class="style1">Cookie用在會員登入的身分檢查</span>
    </p>
    <p>
        本範例的 帳號 與 密碼 都是 123
    </p>
    <form id="form1" runat="server">
    <p>
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Login..."
            OnClick="Button1_Click" />
    </p>
    </form>

</body>
</html>
