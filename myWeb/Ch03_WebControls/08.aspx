<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08.aspx.cs" Inherits="Ch03_WebControls_8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3 -- 一年一班的班長選舉</title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
        }
        .style2
        {
            font-weight: bold;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <b><span class="style1">2008年 台灣小學，</span><br class="style1" />
            <span class="style1">&nbsp;&nbsp;&nbsp; 一年一班的班長選舉</span></b><br />
        <br />
        <span class="style2">班長候選人</span>：<br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatLayout="OrderedList">
            <asp:ListItem>李小輝</asp:ListItem>
            <asp:ListItem>連小戰</asp:ListItem>
            <asp:ListItem>宋小魚</asp:ListItem>
            <asp:ListItem>馬小九</asp:ListItem>
            <asp:ListItem>謝小夫</asp:ListItem>
            <asp:ListItem>呂小蓮</asp:ListItem>
            <asp:ListItem>電火球</asp:ListItem>
        </asp:CheckBoxList>
        <asp:Button ID="Button1" runat="server" Text="Button--投票！可複選！" OnClick="Button1_Click" />
        <br />
        <br />
        您剛剛投票給哪些人？&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    </div>
    </form>
</body>
</html>
