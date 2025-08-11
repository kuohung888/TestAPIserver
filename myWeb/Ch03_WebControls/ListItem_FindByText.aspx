<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListItem_FindByText.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListItem_FindByText" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ListItemCollection的 <strong>.FindByText()方法</strong>（另一個 <strong>.FindByValue()方法</strong>方法
        作法雷同）<br />
        <br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.findbytext.aspx">
            http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.findbytext.aspx</a><br />
        <br />
        請輸入搜尋的關鍵字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button_Search" 
            onclick="Button1_Click" />
        <br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Height="150px"
            Width="100px">
            <asp:ListItem Value=".89">apples</asp:ListItem>
            <asp:ListItem Value=".49">bananas</asp:ListItem>
            <asp:ListItem Value="2.99">cherries</asp:ListItem>
            <asp:ListItem Value="1.49">grapes</asp:ListItem>
            <asp:ListItem Value="2.00">mangos</asp:ListItem>
            <asp:ListItem Value="1.09">oranges</asp:ListItem>
        </asp:ListBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #CC0000" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
