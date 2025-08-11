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

    <%
        //***********************************************************************************(start)***
        //  Session如果是 null，一使用就會報錯。
        //  最好先檢查一下是否為 null ，請參閱 defense.aspx 的寫法
        if (Session["Login"] == "OK")     
        {
           Response.Write("<h3>恭喜您，您成功登入，才會看見這一頁！ Session_Loging_End.aspx</h3><hr />");
           Response.Write("<br />您的個人資料是----<br>");
           Response.Write("<br />    帳號 =>  " + Session["u_name"]);
           Response.Write("<br />    密碼 =>  " + Session["u_passwd"]);
         }
        else
        {
           Response.Write("<h3><font color=red><b>嚴重警告！</b></font>您的帳號、密碼錯誤！是非法使用者～</h3>");
           Response.End();     //--註解：程式立刻終止！
        }

        Response.Write("<br /><br /><font color=blue>");
        Response.Write("<h3>此為網站管理區，外人莫入！</h3></font>");

        Response.Write("<h3>Session.SessionID -- " + Session.SessionID + "</h3>");     
        //*************************************************************************************(end)***
    %>



    <div id="countdown"></div>
    <!-- *** 設定值 ,請到這裡修改.   countdown/assets/js/script.js *** -->

    <!-- JavaScript includes -->
    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="countdown/assets/countdown/jquery.countdown.js"></script>
    <script src="countdown/assets/js/script.js"></script>
</body>
</html>
