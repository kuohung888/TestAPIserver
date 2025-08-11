<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="ucA.ascx" tagname="ucA" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	<uc1:ucA ID="ucA1" runat="server" />
    
    </div>
    	<p>
			我是default.aspx,直接插入ucA,希望它必填</p>
		<p>
			<asp:Button ID="Button1" runat="server" Text="Button" />
		</p>
    </form>
</body>
</html>
