<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_PostBackUrl_Click_2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Button_PostBackUrl_Click_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Button控制項的「PostBackUrl屬性」與「Click事件」能否一起做到？#2
        <br />
        <br />
        <span class="auto-style1"><strong>沒有</strong>設定 PostBackUrl屬性（保持空白）</span></div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
                 Text="Button_「不」設定PostBackUrl屬性" ForeColor="Red" />
        </p>    
    </div>
    </form>
    <p>
        改用後置程式碼的 Response.Redirect()或 Server.Transfer()來做，便能成功</p>
    <p>
        Server.Transfer()不可連結到外面網站</p>
</body>
</html>
