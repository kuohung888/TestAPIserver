<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03_Button_HistoryBack.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_3_Button_HistoryBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Button與 JavaScript -- 回到上一頁 (搭配<span class="style1">javascript:window.history.back(-1);</span>)<br />
        <br />
        <asp:Button ID="Button1" runat="server" 
            onclientclick="javascript:window.history.back(-1);" Text="返回上一頁 #1" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" 
            onclientclick="window.location.href='3_Button_JavaScript.aspx';" Text="返回上一頁 #2" />
            &nbsp;......使用 ASP.NET的 Button 似乎有問題
            <hr />
    
        <br />
        <br />
        改用傳統  html的&lt;input&gt;按鈕，就正常了。<br />
&nbsp;<input id="Button2" type="button" value="傳統 HTML button" onclick="javascript:window.history.back();" /></div>
    </form>
</body>
</html>
