<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cookie_01</title>
</head>
<body>
    <%
//--註解：第一種寫法。 針對第一個 Cookie，會直接設定 Cookies 集合的值。
Response.Cookies["userName"].Value = "MIS2000 Lab.";
Response.Cookies["userName"].Expires = DateTime.Now.AddDays(1);

//--註解：第二種寫法。
//--建立 HttpCookie型別的物件執行個體、設定其屬性，然後經由 Add方法將其加入 Cookies集合。
HttpCookie aCookie = new HttpCookie("lastVisit");
aCookie.Value = DateTime.Now.ToShortDateString();
aCookie.Expires = DateTime.Now.AddDays(1);
Response.Cookies.Add(aCookie);

Response.Write("寫入Cookie ，完成！");    
    %>
</body>
</html>
