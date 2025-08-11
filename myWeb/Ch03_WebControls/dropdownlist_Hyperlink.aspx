<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_Hyperlink.aspx.cs" Inherits="Ch03_WebControls_dropdownlist_Hyperlink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        點選後，便可以超連結到其他網站：<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="www.yahoo.com.tw">Yahoo</asp:ListItem>
            <asp:ListItem Value="www.sina.com">Sina</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw/mis2000lab/">MIS2000 Lab.</asp:ListItem>
            <asp:ListItem Value="www.find.org.tw">III-FIND</asp:ListItem>
        </asp:DropDownList>    
    
    </div>
    </form>
</body>
</html>
