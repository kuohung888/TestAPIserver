<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Web_Keyboard.aspx.vb" Inherits="Book_Sample_Ch03_Program__Book_WebControls_MIS2000Lab_book_image_Web_Keyboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


    <link rel="stylesheet" type="text/css" href="Web_Keyboard/keyboard.css">

    <script type='text/javascript' src="Web_Keyboard/jquery.keyboard.js"></script>
    
    <link rel="stylesheet" type="text/css" href="Web_Keyboard/jquery-ui.css">

    <style type='text/css'>
    body  {
       font-family:Arial;
       font-size : 10pt;
       padding : 10px;
    }
    .auto-style1 {
            font-size: large;
    }
  </style>



    <script type='text/javascript'>//<![CDATA[ 
        $(window).load(function () {
            $(document).ready(function () {
                $('#TextBox1').keyboard();
                $('#TextBox2').keyboard({
                    layout: 'num',
                    restrictInput: true,
                    preventPaste: true,
                    autoAccept: true
                }).addTyping();
            });
        });//]]>  

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        資料來源：<a href="http://jsfiddle.net/jquerybyexample/33Qja/embedded/result/">http://jsfiddle.net/jquerybyexample/33Qja/embedded/result/</a><br />
        <br />
        <strong><span class="auto-style1">網頁上出現的虛擬鍵盤</span></strong><br />
        <br />
        <br />
    
    </div>
        Keyboard : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        NumPad :
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </form>
</body>
</html>
