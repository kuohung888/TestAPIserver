<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01_InlineCode.aspx.cs" Inherits="Ch02_1_InlineCode" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的第一支ASP.NET程式</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
        //註解：這是我的第一支ASP.NET程式
        Response.Write("Hello! The World");
    %>
    </div>
    </form>
 
</body>
</html>