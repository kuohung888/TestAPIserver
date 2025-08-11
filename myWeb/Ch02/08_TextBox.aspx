<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_TextBox.aspx.cs" Inherits="Book_Sample_Ch02_8_TextBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        請輸入一個整數（1~20之間）<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button_大於10? 或是小於10?" 
            onclick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
