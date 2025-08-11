<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_test.aspx.cs" Inherits="Book_Sample_Ch16_Cookie_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"
            Style="font-weight: 700; background-color: #FFFF00"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
            Text="Button" />

    </div>
    </form>
</body>
</html>
