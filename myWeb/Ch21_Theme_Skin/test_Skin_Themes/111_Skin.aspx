<%@ Page Language="C#" Theme="Theme1" AutoEventWireup="true" CodeFile="111_Skin.aspx.cs" Inherits="Book_Sample_test_Skin_Themes_111_Skin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span class="style1">請參閱 App_Themes目錄</span><br />
        <br />
        <br />
        111_Skin.aspx<br />
        <br />
        所謂的「Theme」，是在程式的第一行，設定<span style="color: #ff0000">整頁</span>的CSS外觀。<br />
        寫法如下：<br />
        &nbsp; &nbsp; &nbsp;
        &lt;% Page Language="<strong>VB</strong>或<strong>C#</strong>" <strong>Theme="</strong><span style="color: #ff0000; background-color: #ffff66"><strong>Theme1</strong></span>"&nbsp;
        %&gt;<br />
        <br />
        =====================================<br />
        或是採用「Skin」的方法，<br />
        在<span style="color: #ff0000">每一個</span>Web Controls，設定獨特的CSS外觀。但此CSS可沿用到其他控制項。<br />
        <br />
        測試<strong>文字</strong>：<asp:TextBox ID="TextBox1" runat="server" SkinID="TB_Skin01"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" SkinID="Btn_Skin01" />
        <asp:Button ID="Button3" runat="server" Text="Button" SkinID="Btn_Skin02" /><br />
        <br />
        測試<strong>數字</strong>：<asp:TextBox ID="TextBox2" runat="server" SkinID="Num1"></asp:TextBox><br />
        <br />
    </div>
    </form>
</body>
</html>
