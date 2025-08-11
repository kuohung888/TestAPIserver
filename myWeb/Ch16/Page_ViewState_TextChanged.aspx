<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeFile="Page_ViewState_TextChanged.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Page_ViewState_TextChanged" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style3
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b>取消&nbsp; <span class="style3">Page</span></b>的 ViewState（<span class="style1">EnableViewState屬性 = false</span>）<br />
        將無法判定 TextBox裡面的文字是否異動？而無法引發 TextChanged事件。<br />
        <br />
        執行步驟：<br />
        (1).&nbsp; 同時輸入一些文字，按下 Button按鈕。<br />
        <br />
        (2).&nbsp; 同時刪除原本的文字，重新按下 Button按鈕。<br />
        <br />
        ===========================================
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <br />
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        （<span class="style2">EnableViewState屬性 = true。預設值</span>）<br />
        <br />
        <asp:Label ID="Label2" runat="server" Style="font-weight: 700; color: #0000FF"></asp:Label>
        <br />
    </div>
    </form>
</body>
</html>
