<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_WaterMark_HTML5.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_WaterMark_HTML5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>HTML5新的浮水印功能</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <strong>HTML5新的浮水印功能，只要在 TextBox裡面加入<span class="auto-style1"> PlaceHolder屬性</span>即可。</strong><br />
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" PlaceHolder="浮水印"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label1" runat="server" ForeColor="#009900" style="font-weight: 700"></asp:Label>
    </form>
</body>
</html>
