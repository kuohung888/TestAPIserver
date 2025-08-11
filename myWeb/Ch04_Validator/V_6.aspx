<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_6.aspx.cs" Inherits="Ch04_Validator_V_6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        自己寫程式來作驗證<br />
        <br />
        請輸入：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" />
    
    </div>
    <br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="CustomValidator，驗證錯誤！！" 
        onservervalidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
    <br />
    <br />
    後置程式碼（Code Behind）會透過 _ServerValidate()事件來處理：<br />
    您剛剛輸入的資料是：<asp:Label ID="Label1" runat="server" Font-Bold="True" 
        ForeColor="Blue" Text="Label"></asp:Label>
    </form>
 
</body>
</html>
