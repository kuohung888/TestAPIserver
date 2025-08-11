<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_TextMode_Password_03.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_TextMode_Password_03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            == 密碼再次確認&nbsp;&nbsp;&nbsp;&nbsp; （使用<strong>驗證控制項</strong>）==
        </p>
        <p>
            <span class="auto-style3">請輸入密碼：</span><asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">&nbsp;(TextMode=Password） </span>
        </p>
        <p>
            <span class="auto-style3">密碼再次確認：</span><asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" CssClass="auto-style3" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">(TextMode=Password，</span><span class="auto-style2"><strong>AutoPostBack=true</strong></span><span class="auto-style3">）</span>
        </p>
        <p>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="CompareValidator驗證控制項！（密碼輸入錯誤）" ForeColor="Red" style="font-weight: 700"></asp:CompareValidator>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **** Operator屬性 = Equal。&nbsp; 兩個 TextBox作比較 ****</p>
        <p>
            &nbsp;
        </p>
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
            2.&nbsp; 改用「驗證控制項」
        </div>
    </form>
</body>
</html>
