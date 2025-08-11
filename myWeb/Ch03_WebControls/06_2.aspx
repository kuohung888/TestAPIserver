<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_2.aspx.cs" Inherits="Ch03_WebControls_6_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        文章分類：
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">政治</asp:ListItem>
            <asp:ListItem>教育</asp:ListItem>
            <asp:ListItem>娛樂</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:Button ID="Button2" runat="server" Text="Button2_選好了～" OnClick="Button2_Click" />
        <br />
        <br />
    </div>
    &nbsp;&nbsp;&nbsp; 您剛剛點選的選項 Text：&nbsp;
    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
    <br />
    &nbsp;&nbsp;&nbsp; 您剛剛點選的選項 Value：<asp:Label ID="Label2" runat="server" ForeColor="#FF3300"></asp:Label>
    <br />
    <hr />
    <br />
    在此新增 Item文字，就會加入上方的DropDownList控制項裡面--<br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Button1_增加一個選項" OnClick="Button1_Click" />
    </form>
</body>
</html>
