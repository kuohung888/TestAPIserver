<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList_HTML5_Group.aspx.cs" Inherits="Book_Sample_Ch03_HTML_Web_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
	<br />
	<br />
	透過 Literal產生HTML5的下拉式選單（有Group），再透過Request來抓取值
	<hr />


    <form id="form1" runat="server">
    <div>
    
    	<asp:Literal ID="Literal1" runat="server"></asp:Literal>

		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
    </div>
    </form>
</body>
</html>
