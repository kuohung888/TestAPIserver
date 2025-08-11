<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UC_User_Login001.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_UC_User_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>「第一種」依照不同的權限，看見不同的UC</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #000099;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Please Login --<br />
        <br />
        UserName :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Password :&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button_Login" OnClick="Button1_Click" />
    
        <br />
        <br />
        <br />
        使用者登入之後，會依照不同的<span class="style1">權限</span><br />
&nbsp;&nbsp; 在後端管理區裡面，看見不同的 <span class="style2">UC</span></div>
    </form>
</body>
</html>
