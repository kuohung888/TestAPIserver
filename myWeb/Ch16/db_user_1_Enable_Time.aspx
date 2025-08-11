<%@ Page Language="C#" AutoEventWireup="true" CodeFile="db_user_1_Enable_Time.aspx.cs" Inherits="Book_Sample_B12_Member_Login_Session_db_user_1_Enable_Time" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>每隔「九十天」需要更換密碼。密碼過期</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        每隔「九十天」需要更換密碼。密碼過期<br />
        <br />
        <br />
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_Login" />
        <br />
        <br />
    </form>
</body>
</html>
