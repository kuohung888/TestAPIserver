<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Application_PublicAnnouce_1.aspx.cs" Inherits="Book_Sample_Ch16_Application_PublicAnnouce_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            background-color: #009900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        利用 Application來做<span class="style1"><strong><span class="style2">網站的緊急公告 #1</span></strong></span> ---- 請在此輸入<br />
        <br />
        <br />
        (1).&nbsp; 請先打開這個網站，看看原本的狀態：<strong><a href="Application_PublicAnnouce_2.aspx" target="_blank">Application_PublicAnnouce_2.aspx</a></strong><br />
        <br />
        (2). 然後輸入公告內容（一段話）<br />
        <br />
        
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        請輸入公告 : 
        <asp:TextBox ID="TextBox1" runat="server" Width="300px">緊急公告！下午13:00~13:30系統重新開機。</asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button--發佈" 
            onclick="Button1_Click" />
        <br />
        <br />
        <br />
        (3). 請重新更新 畫面，便能看見結果。<br /><strong><a href="Application_PublicAnnouce_2.aspx" target="_blank">Application_PublicAnnouce_2.aspx</a></strong>
    
    </div>
    </form>
</body>
</html>

