<%@ Page Language="C#"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    改用 .inc來取代 defense.aspx檔案（不然的話，Compiler不會過）<br />

    <!-- **** 重點在此！！ ******************************* -->
    <!--#INCLUDE FILE="defense.inc"-->
    <!-- **** 重點在此！！ ******************************* -->

    <%
                Response.Write("<br />......您好！這是改良後的程式......");
    %>

</body>
</html>
