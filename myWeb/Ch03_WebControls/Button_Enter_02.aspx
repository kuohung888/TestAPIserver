<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_Enter_02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Button_Enter_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Button2">
        <div>
            (2). 輸入文字以後，直接按下「Enter」做送出（Submit） ，會觸發哪一個按鈕？<br />
            <br />
            <span class="auto-style1"><strong>&lt;form&gt;設定 DefaultButton屬性可解決。</strong></span><br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click" />
            <br />
            <br />

        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Button2" OnClick="Button2_Click" />
        （&lt;form <span class="auto-style1"><strong>DefaultButton</strong></span>=&quot;Button2&quot;）<p>
            <asp:Button ID="Button3" runat="server" Text="Button3" OnClick="Button3_Click" />
        </p>
    </form>
</body>
</html>

