<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register src="ucB.ascx" TagPrefix="uc1" TagName="ucB"  %>
<%@ Register Src="ucA.ascx" TagPrefix="uc1" TagName="ucA" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    	我是default2.aspx<br />
        <br />
        插入uc A<br />
        <uc1:ucA runat="server" ID="ucA" />
        <br />
        <br />
		插入uc B<br />
		<br />
		<uc1:ucB ID="ucB1" runat="server" />
    
    </div>
    	<br />
		<br />
		<br />自己加在畫面上的（非uc）<br /><br />
		<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
		<br />
		<asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>
