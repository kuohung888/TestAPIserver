<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucA.ascx.cs" Inherits="ucA" %>
<p>
    ==================================<br />
	我是uc A:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

	<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    <br />重點在此！uc A後置程式碼有玄機！<asp:Button ID="Button1" runat="server" Text="Button" />
    <br />==================================<br />
</p>

