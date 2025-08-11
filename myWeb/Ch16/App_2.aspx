<%@ Page Language="C#"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>App_2.aspx</title>
</head>
<body>
    <%
          //--註解：這段程式是 Inline Code，檔名為 App_2.aspx。
          //             讀取上一隻程式寫入Application的值。  

          Response.Write("Application裡面的值，整個網站內的程式都可以共用！<hr />");
          Response.Write("<br> my_test1的值---- " + Application["my_test1"].ToString());
          Response.Write("<br> my_test2的值---- " + Application["my_test2"].ToString());

    %>
</body>
</html>
