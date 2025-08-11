<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inline Code</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
<%=("Hello!The World") %>
<% //--註解：在此寫成 Inline Code，透過「=」代替 Response.Write()，如果C#程式的結尾加上「;」號反而會錯誤 %>

<br />
<br />

<% Response.Write("Hello!The World"); %>
<% //--註解：這種寫法「務必」在C#程式的結尾加上「;」號，才正確！ %>

<br />
<br />

<%="***您好！***" %>

    </div>
    </form>
</body>
</html>
