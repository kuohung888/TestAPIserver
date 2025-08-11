<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05_1.aspx.cs" Inherits="Ch03_WebControls_5_1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch3 「HyperLink」控制項 / Button ---- CommandName屬性</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        當使用者按下不同的按鈕，畫面上面的「HyperLink」控制項就會依照不同的按鈕，變化成不同的超連結！</div>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="台灣Yahoo!網站 www.yahoo.com.tw" CommandName="Yahoo"
        OnCommand="Button1_Command" /> 

    &nbsp;&nbsp;

    <br />
    <asp:Button ID="Button2" runat="server" Text="資策會FIND網站 www.find.org.tw" CommandName="FIND"
        OnCommand="Button2_Command" />

    &nbsp;&nbsp;

    <br />
    <asp:Button ID="Button3" runat="server" Text="MIS2000 Lab.網站  www.dotblogs.com.tw/mis2000lab/"
        CommandName="MIS2000" OnCommand="Button3_Command" />

    <br />
    <br />

    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>

    </div>
    </form>
</body>
</html>
