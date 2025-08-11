<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Lock_Test_01.aspx.cs" Inherits="Book_Sample_Ch16_Session_Lock_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        輸入帳號、密碼之後（預設為123），取得 Session。<br />
        <br />
        系統會<b>沈睡10秒</b>，<br />
        這時候<span class="style1">執行 Session_Lock_Test_02.aspx</span>會發現卡住了！！<br />
        必須等待這支程式完成後，其他使用「<b>同一個Session的程式</b>」才能運作。
    </div>
    <p>
        Account:<asp:TextBox ID="TextBox1" runat="server">123</asp:TextBox>
    </p>
    <p>
        Password:<asp:TextBox ID="TextBox2" runat="server">123</asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        &nbsp;&nbsp;&nbsp; <b><a href="Session_Lock_Test_02.aspx" target="_blank">Session_Lock_Test_02.aspx</a></b>
    </p>
    </form>
</body>
</html>
