<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>未</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%        
        Response.Write("<p>用戶端的瀏覽器支援功能：</p>");
        Response.Write("Type = " + Request.Browser.Type + "<br>");
        Response.Write("Name = " + Request.Browser.Browser + "<br>");
        Response.Write("Version = " + Request.Browser.Version + "<br>");
        Response.Write("Major Version = " + Request.Browser.MajorVersion + "<br>");
        Response.Write("Minor Version = " + Request.Browser.MinorVersion + "<br>");
        Response.Write("Platform 作業系統 = " + Request.Browser.Platform + "<br>");
        Response.Write("Is Beta = " + Request.Browser.Beta + "<br>");
        Response.Write("是否為 Web Crawler 搜尋引擎= " + Request.Browser.Crawler + "<br>");
        Response.Write("Is AOL = " + Request.Browser.AOL + "<br>");
        Response.Write("Is Win16 = " + Request.Browser.Win16 + "<br>");
        Response.Write("Is Win32 = " + Request.Browser.Win32 + "<br>");
        Response.Write("Supports Frames （網頁框架）= " + Request.Browser.Frames + "<br>");
        Response.Write("Supports Tables = " + Request.Browser.Tables + "<br>");
        Response.Write("Supports Cookies = " + Request.Browser.Cookies + "<br>");
        Response.Write("Supports VB Script = " + Request.Browser.VBScript + "<br>");
        Response.Write("Supports JavaScript = " + Request.Browser.JavaScript + "<br>");
        Response.Write("Supports Java Applets = " + Request.Browser.JavaApplets + "<br>");
        Response.Write("Supports ActiveX Controls = " + Request.Browser.ActiveXControls + "<br>");
        Response.Write("CDF（網路廣播，Webcasting） = " + Request.Browser.CDF + "<br>");
        %>
    </div>
    </form>

</body>
</html>
