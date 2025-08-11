<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Session_attribute.aspx</title>
</head>
<body>
    <%
          //--註解：這段程式是 Inline Code，檔名為 Session_attribute.aspx。

          Session["my_test1"] = "***只有你一人與這一個瀏覽器***看的到這訊息！";

          Response.Write("****執行完畢！****<hr />");

          Response.Write("<br /> SessionID = " + Session.SessionID);
  
          Response.Write("<br /> Session有幾個物件？  " + Session.Count.ToString());
          Response.Write("<br /> Session的模式（Mode）？  " + Session.Mode.ToString());
          Response.Write("<br /> 採用無Cookie狀態嗎？  " + Session.IsCookieless.ToString());
  
          Response.Write("<br /> 是否為新建立的 Session？  " + Session.IsNewSession.ToString());
          Response.Write("<br /> 是否「唯讀」？  " + Session.IsReadOnly.ToString());
  
          Response.Write("<br /> Session的生命週期（分鐘） = " + Session.Timeout.ToString());
          Response.Write("<br /> Session有幾個索引鍵 = " + Session.Keys.Count.ToString());
    %>
</body>
</html>
