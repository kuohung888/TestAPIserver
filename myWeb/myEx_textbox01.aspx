<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_textbox01.aspx.cs" Inherits="myEx_textbox01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            網頁載入預設執行：<span style="color:blueviolet"><asp:Label ID="lbltxt" runat="server" Text=""></asp:Label></span>
            <br />
            <br />
            <br />
            第1個Textbox：(設定AutoPostBack)<br />
            <asp:TextBox ID="txtbox1" runat="server" AutoPostBack="True" OnTextChanged="txtbox1_TextChanged"></asp:TextBox>
            <br />
            <span style="color:blueviolet"><asp:Label ID="lbltxt2" runat="server"></asp:Label></span>
            <br />
            <br />
            <br />
            第2個Textbox：(無設定AutoPostBack)<br />
            <br />
            <asp:TextBox ID="txtbox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" />
            <br />
            <span style="color:blueviolet"><asp:Label ID="lbltxt3" runat="server"></asp:Label></span>
        </div>
    </form>
</body>
</html>
