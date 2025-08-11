<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_2_DataSet_Manual_Error2.aspx.cs" Inherits="Book_Sample_Ch10_Default_2_DataSet_Manual_Error2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>**錯誤範例**</title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
    <h3>**錯誤範例**</h3>
        登入以後，為什麼按下Button按鈕<span class="auto-style1"><strong>兩次</strong></span>，才會動作（連到下一頁）？？<br />
        <br />
        在後置程式碼設定Button的「<strong>PostBackUrl屬性</strong>」，<br />
        而 <strong>&quot;不&quot;</strong>使用Response.redirect() 或 Server.Transfer()方法來作重新導向。<br />
        <br />
        帳號：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        密碼：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

    </div>
    </form>
</body>
</html>
