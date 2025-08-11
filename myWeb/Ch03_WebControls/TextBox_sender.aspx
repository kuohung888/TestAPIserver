<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_sender.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_sender" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #CC0066;
        }
    </style>
</head>
<body>
    <p>
        本範例有兩個重點：
    </p>
    <p>
        第一，兩個 TextBox<span class="auto-style1"><strong>「共用」同一個 TextChanged事件</strong></span>。
    </p>
    <p>
        第二，介紹<span class="auto-style1"><strong>事件中的 sender參數</strong></span>。您也可以參考另一個類似範例 03_Multi_Button.aspx。
    </p>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
    <p>
        執行步驟：
    </p>
    <p>
        <strong>修改其中一個 TextBox的文字，然後按下 Button。</strong>
    </p>
    <p>
        1:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged">TextBox1預設文字</asp:TextBox>
    </p>
    <p>
        2:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox1_TextChanged">TextBox2預設文字</asp:TextBox>
    </p>
    <div>

        <asp:Button ID="Button1" runat="server" Text="Button" />

    </div>
    </form>
    <p>
        註解：TextBox有無設定 AutoPostBack屬性，都不影響結果。
    </p>
</body>
</html>

