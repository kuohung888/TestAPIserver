<%@ Control Language="C#" AutoEventWireup="true" CodeFile="1Book_UC_DropDownList.ascx.cs" Inherits="Book_UC" %>

<h3>公開屬性。DisplayBook</h3>
********************************************************<br /><br />
兩個Panel都設定為隱形（看不見 .Visible=false），不然會同時出現在 .aspx畫面上<br />

<asp:Panel ID="VBPanel" runat="server" visible="false">
          <asp:Image ID="Image1" runat="server" ImageUrl="Book_VB.gif" />
</asp:Panel>


<asp:Panel ID="CSPanel" runat="server" visible="false">    
          <asp:Image ID="Image2" runat="server" ImageUrl="Book_CS.gif" />
</asp:Panel>