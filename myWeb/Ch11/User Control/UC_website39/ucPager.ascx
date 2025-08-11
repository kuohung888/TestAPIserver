<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucPager.ascx.cs" Inherits="ucPager" %>
<asp:Button ID="Button1" runat="server" Text="1" CommandArgument="1" OnCommand="Button_Command" />
<asp:Button ID="Button2" runat="server" Text="2" CommandArgument="2" OnCommand="Button_Command" />
<asp:Button ID="Button3" runat="server" Text="3" CommandArgument="3" OnCommand="Button_Command" />

<br />

<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
	<asp:ListItem></asp:ListItem>
	<asp:ListItem>1</asp:ListItem>
	<asp:ListItem>2</asp:ListItem>
	<asp:ListItem>3</asp:ListItem>
</asp:DropDownList>