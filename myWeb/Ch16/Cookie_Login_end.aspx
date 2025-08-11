<%@ Page Language="C#" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>登入後，才會看見這一頁！</title>
</head>
<body>
    <%
   
    if (Request.Cookies["Login"] != null)
    {
        if (Request.Cookies["Login"].Value == "OK")
        {
            Response.Write("<h3>恭喜您，您成功登入，才會看見這一頁！</h3>");
        }
    }
    else
    {
        Response.Write("<h3><font color=red>嚴重警告！</font>您的帳號、密碼錯誤！是非法使用者～</h3>");
        Response.End();     //--註解：程式立刻終止！
    }    

    Response.Write("<br><hr>");
    
    %>
</body>
</html>
