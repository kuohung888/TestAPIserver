<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_TextMode_Password_02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_TextMode_Password_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #009900;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            color: #009933;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            == 密碼再次確認&nbsp;&nbsp; （<span class="auto-style2"><strong>不設定 AutoPostBack=true</strong></span>）==</p>
        <p>
            <span class="auto-style3">請輸入密碼：</span><asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">&nbsp;(TextMode=Password）</span></p>
        <p>
            <span class="auto-style3">密碼再次確認：</span><asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style3" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">(TextMode=Password，</span><span class="auto-style2"><strong>不設定 AutoPostBack=true，改由 Button觸發</strong></span><span class="auto-style1">）</span></p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **** 程式寫在 TextBox2_TextChanged事件裡面</p>
        <p>
            &nbsp;</p>
        <p>
            請輸入姓名：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </p>
    <div>
    
        <br />
        <br />
        因為 AutoPostBack的緣故，密碼欄位會被清空，而無法留下。<br />
        <br />
        解決方法：<br />
        1.&nbsp; 不設定 AutoPostBack即可。<br />
        2.&nbsp; 改用「驗證控制項」</div>
    </form>

</body>
</html>
