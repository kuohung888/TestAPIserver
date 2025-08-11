<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blueshop_01.aspx.cs" Inherits="Book_Sample_Ch15_CrossPage_JavaScript_Blueshop_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        範例來源：<a href="http://www.blueshop.com.tw/board/show.asp?subcde=BRD20120203102903DH9">http://www.blueshop.com.tw/board/show.asp?subcde=BRD20120203102903DH9</a><br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Text="預設值"></asp:TextBox>（千萬不可設定為 ReadOnly）

        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="Button打開下一頁(Pop-up)" />
    
    </div>
    </form>
</body>
</html>
