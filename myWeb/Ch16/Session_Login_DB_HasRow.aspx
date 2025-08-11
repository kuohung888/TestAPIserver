<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Login_DB_HasRow.aspx.cs" Inherits="Book_Sample_Ch16_Session_Login_DB_HasRow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Session最常用在會員登入的身分檢查上面（搭配DB）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #99FF99;
        }
    </style>
</head>
<body>
    <p>
        Session最常用在會員登入的身分檢查上面<span class="style1">（搭配DB）</span>
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
        <asp:Button ID="Button1" runat="server" Text="Login..." OnClick="Button1_Click" />
    </p>
    </form>
</body>
</html>
