<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewState_1.aspx.cs" Inherits="Ch16_ViewState_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ViewState_1</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
            Text="按下去，就會產生ViewState" />
        <br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server">
            <asp:ListItem Value="空空如也">空空如也</asp:ListItem>
        </asp:ListBox>

    </div>
    若要使用 ViewState 屬性，ASP.NET Web 網頁必須具有<span class="style1">伺服器表單項目 (&lt;form
    runat=&quot;server&quot;&gt;)</span>。
    </form>

</body>
</html>
