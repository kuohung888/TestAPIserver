<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Login.aspx.cs" Inherits="Ch16_Session_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Session最常用在會員登入的身分檢查上面</title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <p>
        <strong><span class="auto-style1">Session</span></strong>&nbsp; <span class="auto-style2"><strong>最常用在會員登入的身分檢查上面</strong></span>
    </p>
    <p>
        本範例的 帳號 123  與 密碼 123
    </p>
    <p>
        &nbsp;
    </p>
    <form id="form1" runat="server">
    <p>
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        密碼：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Login..." OnClick="Button1_Click" />
    </p>
    <div>
    </div>
    </form>

</body>
</html>
