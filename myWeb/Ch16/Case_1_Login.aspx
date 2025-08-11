<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Case_1_Login.aspx.cs" Inherits="Ch16_Case_1_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>聊天室 #1</title>
    <style type="text/css">
        .style1
        {
            font-size: large;
            font-weight: bold;
            color: #FF0000;
        }
        .style2
        {
            font-size: small;
            font-weight: bold;
            color: #FF6600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        <span class="style1">聊天室</span>，應用Application與Session的最好範例。</p>
        <hr />
    <p>
        請輸入您的大名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="不准留空白！"></asp:RequiredFieldValidator>
    </p>
    <p>
        您要用什麼顏色的字體？
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="darkred">紅色</asp:ListItem>
            <asp:ListItem Value="darkgreen">綠色</asp:ListItem>
            <asp:ListItem Value="darkblue">藍色</asp:ListItem>
            <asp:ListItem Value="darkgray">灰色</asp:ListItem>
            <asp:ListItem Value="blue">淺藍色</asp:ListItem>
            <asp:ListItem Value="green">淺綠色</asp:ListItem>
            <asp:ListItem Value="purple">紫色</asp:ListItem>
            <asp:ListItem Value="orange">橘色</asp:ListItem>
        </asp:DropDownList>
    &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" style="text-align: center" Text="進入聊天室" 
            onclick="Button1_Click" />
    </p>
    <div class="style2">    
        <hr />
        切記！要設定 Gloabl.asax檔案！</div>
    </form>
 
</body>
</html>