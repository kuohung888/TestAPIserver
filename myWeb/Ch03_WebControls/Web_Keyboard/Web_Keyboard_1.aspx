<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Web_Keyboard_1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Web_Keyboard_Web_Keyboard_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


    <link rel="stylesheet" type="text/css" href="keyboard.css">

    <script type='text/javascript' src="jquery.keyboard.js"></script>

    <link rel="stylesheet" type="text/css" href="jquery-ui.css">

    <style type='text/css'>
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
            （請用 Chrome / Firefox瀏覽器）<br />
            <br />

        </div>
        Keyboard :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>


        <br />
        <br />


        NumPad :
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>


    </form>
</body>
</html>
