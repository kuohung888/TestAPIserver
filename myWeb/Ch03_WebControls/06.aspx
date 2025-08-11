<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06.aspx.cs" Inherits="Ch03_WebControls_6" %>

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
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
