<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_textbox5.aspx.cs" Inherits="myEx_textbox5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>手機號碼格式驗證範例</title>
</head>
<body>
    <h1>手機號碼格式驗證範例</h1>
    <hr />
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" placeholder="請輸入手機號碼"></asp:TextBox>
<asp:Button ID="btnValidatePhone" runat="server" Text="驗證" OnClick="btnValidatePhone_Click" />
<asp:Label ID="lblPhoneResult" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
