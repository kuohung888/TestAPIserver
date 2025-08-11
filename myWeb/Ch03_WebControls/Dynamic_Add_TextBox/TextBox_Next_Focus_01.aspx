<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_Next_Focus_01.aspx.cs" Inherits="TextBox_Next_Focus_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        畫面上有多個 TextBox（全部設定AutoPostBack），填完一個就會自動跳去下一個<br />
        <br />
        您可以按下「Enter」按鈕，跳到下一個TextBox<br />
        <br />
        <br />
        1.<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        2.<asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        3.<asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        4.<asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        5.<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>（不設定、沒事件）
     
        <br />
        <br />              
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
