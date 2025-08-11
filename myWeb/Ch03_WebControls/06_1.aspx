<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_1.aspx.cs" Inherits="Ch03_WebControls_6_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        文章分類：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="True">政治</asp:ListItem>
            <asp:ListItem>教育</asp:ListItem>
            <asp:ListItem>娛樂</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        不需要Submit按鈕。<br />
        透過下拉式選單的AutoPostBack屬性，就能完成。</div>
    </div>
    </form>
</body>
</html>
