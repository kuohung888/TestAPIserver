<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">

  <title>會員登入</title>
 <link href="Styles/Login.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
  <div class="container">

        <h2>會員登入</h2>
        
        <asp:Label ID="lblMsg" runat="server" CssClass="error-msg" Visible="false"></asp:Label>
              <!-- 登入成功訊息 -->
 <asp:Label
     ID="lblSuccess"
     runat="server"
     CssClass="success-msg"
     Visible="false">
 </asp:Label>
        <div class="form-group">
            <asp:Label ID="lblUser" runat="server" Text="帳號：" AssociatedControlID="txtUser" />
            <asp:TextBox ID="txtUser" runat="server" CssClass="input-field" />

             <!-- RequiredFieldValidator：用戶端驗證必填 -->
      <asp:RequiredFieldValidator 
          ID="rfvUser" 
          runat="server" 
          ControlToValidate="txtUser"
          ErrorMessage="請輸入帳號"
          CssClass="field-error"
          Display="Dynamic"
          EnableClientScript="true" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblPass" runat="server" Text="密碼：" AssociatedControlID="txtPass" />
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input-field" />
            <asp:RequiredFieldValidator 
          ID="rfvPass" 
          runat="server" 
          ControlToValidate="txtPass"
          ErrorMessage="請輸入密碼"
          CssClass="field-error"
          Display="Dynamic"
          EnableClientScript="true" />
        </div>

   
   

        <asp:Button ID="btnLogin" runat="server" Text="登入" CssClass="btn-submit"
                    OnClick="btnLogin_Click" />

  </div>
</asp:Content>
