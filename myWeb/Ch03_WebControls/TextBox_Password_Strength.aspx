<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_Password_Strength.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_Password_Strength" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="auto-style1">密碼強度</span></strong>（僅為簡單範例，給入門者練習而已）<br />
        <span class="auto-style2">練習 AutoPostBack屬性、OnTextChanged事件</span><br />
        <br />
        請輸入文字、數字、符號<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        (AutoPostBack = True)<br />
        <br />
        請輸入姓名<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" />
    
    </div>
    </form>
</body>
</html>
