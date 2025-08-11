<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02_LinkButton.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_02_LinkButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Button（包含三兄弟 -- Button / LinkButton / ImageButton）的 <strong>PostBackUrl屬性</strong></div>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" PostBackUrl="http://www.dotblogs.com.tw/mis2000lab/" Text="Button_連結到MIS2000 Lab.網站" />
    </p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="http://www.dotblogs.com.tw/mis2000lab/">LinkButton_連結到MIS2000 Lab.網站</asp:LinkButton>
    </p>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Book_Sample/企鵝老師.gif" PostBackUrl="http://www.dotblogs.com.tw/mis2000lab/" />
    </form>
</body>
</html>
