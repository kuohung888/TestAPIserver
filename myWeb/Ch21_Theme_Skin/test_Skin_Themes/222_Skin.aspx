<%@ Page Language="C#" AutoEventWireup="true" CodeFile="222_Skin.aspx.cs" Inherits="Book_Sample_test_Skin_Themes_222_Skin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>222_Skin.aspx<br />
            測試「不同身分」，觸發不同的 Theme<br />
        </strong>
        ==============================<br />
        <br />
        輸入 admin / admin 就是管理員身分，網頁的Theme會隨之改變。<br />
        <br />
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Login，請輸入admin" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
