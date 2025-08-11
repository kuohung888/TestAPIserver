<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2_Popup.aspx.cs" Inherits="Book_Sample_Ch15_test_Popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>沿用「第二種作法」進行跨網頁張貼</title>



</head>
<body>
    <form id="form1" runat="server">
    <div>
    
繃出的 Pop-up網頁  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        
        <br />
        <br />
        
        <asp:Button ID="Button1" runat="server" 
            OnClientClick="form1.target=opener.name;" 
            PostBackUrl="1_Parent.aspx"
            Text="會把您填入的數值，帶回上一個網頁(1_Parent.aspx)" />
        
        <br />

    </div>
    </form>
</body>
</html>
