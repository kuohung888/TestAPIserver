<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_PostBackUrl_Click_1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Button_PostBackURL_Click" %>

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
    
        Button控制項的「PostBackUrl屬性」與「Click事件」能否一起做到？#1</div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" 
                PostBackUrl="http://www.dotblogs.com.tw/mis2000lab/" Text="Button_已設定PostBackUrl屬性" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            答案是：<span class="auto-style1"><strong>做不到</strong></span></p>
    </form>
</body>
</html>
