<%@ Page Language="C#"  %>


<%@ Register src="defense_WebUserControl.ascx" tagname="defense_WebUserControl" tagprefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ************************************************************* -->
        <uc1:defense_WebUserControl ID="defense_WebUserControl1" runat="server" />
        <!-- ************************************************************* -->


    <%
        Response.Write("<hr /><h2>......您好！這是改良後的程式（改用UC取代 Include file）......</h2>");
    %>
    </form>
</body>
</html>
