<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_sender_Button_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />
        <br />
    
        畫面上有三個Button，按下去之後，要出現 Hello!The World字樣<br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button1" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button2" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button3" />
    
    </div>
    </form>
</body>
</html>
