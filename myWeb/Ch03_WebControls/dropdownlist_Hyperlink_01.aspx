<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_Hyperlink_01.aspx.cs" Inherits="Ch03_WebControls_dropdownlist_Hyperlink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        點選後，便可以超連結到其他網站：<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True"
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="www.sina.com">Sina</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw">DotBlogs</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw/mis2000lab/">MIS2000 Lab.</asp:ListItem>
            <asp:ListItem Value="www.find.org.tw">III-FIND</asp:ListItem>
        </asp:DropDownList>
    
    &nbsp;<br />
        <br />
        （啟動了 <b>AutoPostBack屬性</b>。但是有一個<b>缺點：第一個選項，在第一次不能被點選到</b>）</div>
    </form>
</body>
</html>
