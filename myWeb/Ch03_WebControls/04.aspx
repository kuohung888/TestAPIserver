<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04.aspx.cs" Inherits="Ch03_WebControls_4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> 使用 Label控制項來呈現訊息文字  #1</title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        欄位一：<asp:TextBox ID="TextBox1" runat="server" 
                                               ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        &nbsp;（<span class="style1"><strong>沒有</strong></span>設定 
        AutoPostBack。必須按下按鈕，才能觸發<strong> TextChanged事件</strong>）<br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />    
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="color: #0066FF" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" style="color: #FF0000" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" style="color: #009933" Text="Label"></asp:Label>
        <br />
    </div>
    </form>
 
</body>
</html>
