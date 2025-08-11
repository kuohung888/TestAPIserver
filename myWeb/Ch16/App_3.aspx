<%@ Page Language="C#"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>App_1.aspx</title>
</head>
<body>
    <%
          //--註解：這段程式是 Inline Code，檔名為 App_3.aspx。

        Response.Write("Application的值也可以進行修改<hr />");
            
          Application.Lock();
              Application["my_test1"]  = "哈哈，被我偷改了....Bye Bye!";
              Application["my_test2"] = (Convert.ToInt32(Application["my_test2"]) + 999);
          Application.UnLock();


          Response.Write("<br><br> Application裡面的值，整個網站內的程式都可以共用！<hr />");
          Response.Write("<br> my_test1的值---- " + Application["my_test1"].ToString());
          Response.Write("<br> my_test2的值---- " + Application["my_test2"].ToString());
    %>
</body>
</html>
