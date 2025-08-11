<%@ Page Language="C#" AutoEventWireup="true" CodeFile="0_Page_Load_2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_0_Page_Load_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #0066FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        基本觀念！！ 
        #2<br />
        <br />
        <br />
        不管您在畫面（Page）上，按下任何按鈕或是點選控制項，<br />
        重新載入頁面時，都會<strong>再一次觸發 Page_Load事件</strong>。<br />
        <br />
        <br />
        點擊次數：<asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; color: #0066FF" Text="0"></asp:Label>
        &nbsp; （為何第一次，還沒點擊按鈕，就已經是一？）<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_按下滑鼠，畫面的點擊次數就會累加" />
    
        <br />
        <span class="style1">累加的程式，寫在<strong> Page_Load事件</strong></span><br />
        <br />
        <br />
        
        <input id="Submit1" type="submit" value="HTML_submit，仍會累加" /><br />
        <br />
        <input id="Button2" type="button" value="HTML_button" />

    </div>
    </form>
</body>
</html>
