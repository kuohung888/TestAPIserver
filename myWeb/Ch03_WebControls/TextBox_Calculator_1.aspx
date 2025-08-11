<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_Calculator_1.aspx.cs" Inherits="Ch03_WebControls_TextBox_Calculator_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>輸入數字，進行計算 #2</title>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF66;
        }
        .style2
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        輸入數字，進行計算。&nbsp;&nbsp;&nbsp; 結果必須以<span class="style1">「貨幣」格式</span>出現
    </p>
    <form id="form1" runat="server">
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Width="46px" AutoPostBack="True">0</asp:TextBox>
        &nbsp;+
        <asp:TextBox ID="TextBox2" runat="server" Width="46px" AutoPostBack="True">0</asp:TextBox>
        &nbsp;+
        <asp:TextBox ID="TextBox3" runat="server" Width="46px" AutoPostBack="True"
            OnTextChanged="TextBox3_TextChanged">0</asp:TextBox>
        &nbsp;=
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
    </p>
    <div>

        <br />
        本範例不使用按鈕，輸入完成，立即運算！！<br />
        請先把三個 TextBox的<span class="style2">「AutoPostBack」屬性</span>啟動！
    </div>
    </form>

</body>
</html>
