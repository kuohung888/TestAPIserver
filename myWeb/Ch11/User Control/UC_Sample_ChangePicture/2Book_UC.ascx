<%@ Control Language="C#" AutoEventWireup="true" CodeFile="2Book_UC.ascx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_Book_UC" %>

<h3>兩個公開屬性。分別是：DisplayBook與 DisplayUrl</h3>
********************************************************<br />

<asp:Panel ID="VBPanel" runat="server">
    <a target="_blank" runat="server" id="VBLink">
          <asp:Image ID="Image1" runat="server" ImageUrl="Book_VB.gif" />
    </a>
</asp:Panel>


<asp:Panel ID="CSPanel" runat="server">    
    <a target="_blank" runat="server"  id="CSLink">
          <asp:Image ID="Image2" runat="server" ImageUrl="Book_CS.gif" />
    </a>
</asp:Panel>