<%@ Page Language="C#" AutoEventWireup="true" CodeFile="09_Calendar_jQuery_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_09_Calendar_jQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#TextBox1").datepicker();
            //*** 重點！！請把畫面上 TextBox的「ID」寫到這裡！！ ***
        });
    </script>



</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        用日曆挑選日期，jQuery版（DatePicker套件）#1<br />
        <br />
        資料來源：<a href="http://jqueryui.com/datepicker/">http://jqueryui.com/datepicker/</a>
        <br />
        <br />
        <br />
        請輸入日期：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        (ReadOnly=true。請把ID = &quot;TextBox1&quot;寫到 jQuery程式裡面。)<br />
    
    </div>
    </form>
</body>
</html>
