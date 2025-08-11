<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cookie_03</title>
</head>
<body>
    <%
    HttpCookie appCookie = new HttpCookie("AppCookie");
    appCookie.Value = "written by " + DateTime.Now.ToShortDateString();
    appCookie.Expires = DateTime.Now.AddDays(1);
    appCookie.Path = "/Application1";

    Response.Cookies.Add(appCookie);
    
    Response.Write("¼g¤JCookie ¡A§¹¦¨¡I");
    %>
</body>
</html>
