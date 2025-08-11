<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01_InlineCode_2.aspx.cs" Inherits="Ch02_1_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>縮寫的 Response.Write()</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%=("Hello! The World") %>

        <br />
        <!-- HTML註解：最後不可以加上分號（;），否則會錯！！  -->

        <%=("***您好！***") %>
    </div>
    </form>

</body>
</html>

