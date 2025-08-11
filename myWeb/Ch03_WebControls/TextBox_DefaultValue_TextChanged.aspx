<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_DefaultValue_TextChanged.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_DefaultValue_TextChanged" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        輸入一個 TextBox的預設值，能否觸發 <span class="style1"><strong>TextBoxChanged事件</strong></span>？<br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="(1).Button_輸入一個 TextBox的預設值" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <br />
        (2). 動手修改 TextBox裡面的文字，然後把滑鼠點到其他地方，<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 才會觸發 <span class="style1"><strong>TextBoxChanged事件</strong></span><br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" Width="394px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
&nbsp;（<span class="style2">啟動 AutoPostBack</span>）<br />
        <br />
        <asp:Label ID="Label1" runat="server" style="color: #0066FF; font-weight: 700"></asp:Label>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
