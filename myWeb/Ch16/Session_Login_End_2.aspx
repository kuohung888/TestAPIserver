<%@ Page Language="C#"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <!-- 資料來源：http://tutorialzine.com/2011/12/countdown-jquery/ -->
    <!-- Our CSS stylesheet file -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
    <link rel="stylesheet" href="countdown/assets/css/styles.css" />
    <link rel="stylesheet" href="countdown/assets/countdown/jquery.countdown.css" />

    <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>


    <!-- **** 重點在此！！ ******************************* -->
    <!--#INCLUDE FILE="defense.aspx"-->
    <!-- **** 重點在此！！ ******************************* -->

    <%
                Response.Write("<br />......您好！這是改良後的程式......");
    %>



    <div id="countdown"></div>
    <!-- *** 設定值 ,請到這裡修改.   countdown/assets/js/script.js *** -->

    <!-- JavaScript includes -->
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="countdown/assets/countdown/jquery.countdown.js"></script>
    <script src="countdown/assets/js/script.js"></script>

</body>
</html>
