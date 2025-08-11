<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_7_01_Mod.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_7_01_Mod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        這個範例來自微軟MSDN網站。<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.customvalidator.servervalidate(v=VS.100).aspx">
        http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.customvalidator.servervalidate(v=VS.100).aspx</a>
        <br />
        <br />
        請注意<b>後置程式碼！</b><br />
        <br />
        <br />
        <br />
        <br />
        請輸入一個數字：<asp:TextBox ID="TextBox1" runat="server" Width="55px"></asp:TextBox>
        （驗證是否為偶數？）<asp:Button ID="Button1" runat="server" Text="Button" 
            onclick="Button1_Click" />
        <br />
        <asp:CustomValidator ID="CustomValidator1" runat="server" 
            ControlToValidate="TextBox1" Display="Dynamic" 
            ErrorMessage="CustomValidator--出現錯誤！不是偶數～～" Font-Bold="True" 
            ForeColor="Red" onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator--必填！！" 
            ForeColor="#990000"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #CC0066"></asp:Label>
    
    </div>
    </form>
</body>
</html>

