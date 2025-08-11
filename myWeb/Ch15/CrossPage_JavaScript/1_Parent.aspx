<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1_Parent.aspx.cs" Inherits="Book_Sample_Ch15_test_Parent" %>


<%@ PreviousPageType VirtualPath="2_Popup.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>沿用「第二種作法」進行跨網頁張貼</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        範例來源： <a href="http://codeverge.com/asp.net.client-side/cross-page-postback-from-popup-window-to/258889">http://codeverge.com/asp.net.client-side/cross-page-postback-from-popup-window-to/258889</a>
        <br />
        <br />
        <br />
        <br />
        <br />
    
        Label(唯讀) -- <asp:Label ID="Label1" runat="server" Text="***預設值***"></asp:Label>

        <br />
        <br />
        
        <asp:LinkButton ID="LinkButton1" runat="server">按下去，會跳出一個Pop-up視窗</asp:LinkButton>
         

    </div>
    </form>
</body>
</html>
