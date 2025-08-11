<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_add.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        <br />
        <asp:Button ID="Button1" runat="server" Text="按下這個按鈕, 就會看見成果" 
            onclick="Button1_Click" />
    </p>
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>~~~歡迎選擇~~~（自己動手寫入的、靜態加入）</asp:ListItem>
        </asp:DropDownList>
    
    </div>
    </form>
</body>
</html>
