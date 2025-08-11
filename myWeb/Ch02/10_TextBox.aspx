<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10_TextBox.aspx.cs" Inherits="Book_Sample_Ch02_10_TextBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>等到第三章，再來看這範例</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        請輸入一個整數（1~20之間）<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button_大於10?  等於10?  或是小於10?" 
            onclick="Button1_Click" />

    </div>
    </form>
</body>
</html>
