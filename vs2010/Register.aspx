<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .array-example {
            text-align: center;
            margin: 40px auto;
            font-size: 1.5em;
        }
        .array-example h2 {
            color: #2c3e50;
        }
        .array-example button {
            padding: 6px 12px;
            font-size: 1em;
        }

         .container {
         max-width: 600px;
         margin: 0 auto;
         background: white;
         padding: 20px 30px;
         border-radius: 8px;
         box-shadow: 0 0 15px rgba(0,0,0,0.1);

    </style>
    </asp:Content>
<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
    <div class="container">
    <asp:ScriptManager runat="server" />
    <div style="margin:20px;">
      <h3>會員註冊範例</h3>

      <!-- 生日/出生日期 -->
      <asp:Label Text="生日：" runat="server" AssociatedControlID="txtDOB" />
      <asp:TextBox ID="txtDOB" runat="server" Width="120px" />
      <ajaxToolkit:CalendarExtender 
          runat="server" TargetControlID="txtDOB" Format="yyyy-MM-dd" />

      <asp:RequiredFieldValidator 
          runat="server" 
          ControlToValidate="txtDOB"
          ErrorMessage="* 請輸入出生日期" ForeColor="Red" />

      <!-- 自訂驗證：年齡至少滿 18 歲 -->
      <asp:CustomValidator 
          runat="server" 
          ControlToValidate="txtDOB"
          ID="cvAge"
          ErrorMessage="* 年齡需達 18 歲以上"
          ForeColor="Red"
          OnServerValidate="cvAge_ServerValidate" />

      <br /><br />

      <!-- 其他欄位略 -->
      <asp:Button runat="server" Text="提交註冊" OnClick="btnReg_Click" />
      <br /><br />
      <asp:Label runat="server" ID="lblResult" ForeColor="Green" />
    </div>
   </div>     
</asp:Content>