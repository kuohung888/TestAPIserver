<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02.aspx.cs" Inherits="Ch03_WebControls_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        欄位一：<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" 
                  onclick="Button1_Click"
                  Text="請按我&#010;Submit" />
    
        <br />
        <br />
        注意：Button按鈕裡面的文字，想要<strong>換行（隔列呈現）</strong>，請輸入「<span class="style1"><strong>&amp;#010;</strong></span>」。</div>
    </form>
</body>
</html>


