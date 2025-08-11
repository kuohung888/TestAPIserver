<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_textbox03.aspx.cs" Inherits="myEx_textbox02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            底下範例是數字運算(不需要有按鈕事件即可觸發)<br />
            <br />
            <asp:TextBox ID="txtNum1" runat="server" Width="100px"></asp:TextBox>
            +<asp:TextBox ID="txtNum2" runat="server" Width="100px"></asp:TextBox>
            -<asp:TextBox ID="txtNum3" runat="server" Width="100px" AutoPostBack="True" OnTextChanged="txtNum3_TextChanged"></asp:TextBox>
            =<asp:Label ID="lblSum" runat="server"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
