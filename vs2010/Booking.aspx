<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .array-example {
            text-align: center;
            margin: 40px auto;
            font-size: 1.2em;
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
      <h3>站票訂票 (單程／來回)</h3>

      <!-- 出發日期 -->
      <asp:Label Text="出發日期：" runat="server" AssociatedControlID="txtFrom" />
      <asp:TextBox ID="txtFrom" runat="server" Width="120px" />
      <ajaxToolkit:CalendarExtender 
          runat="server" 
          TargetControlID="txtFrom" 
          Format="yyyy-MM-dd" />
      <asp:RequiredFieldValidator 
          runat="server" 
          ControlToValidate="txtFrom"
          ErrorMessage="* 請輸入出發日期" ForeColor="Red" />

      <br /><br />

      <!-- 回程日期 -->
      <asp:Label Text="回程日期：" runat="server" AssociatedControlID="txtTo" />
      <asp:TextBox ID="txtTo" runat="server" Width="120px" />
      <ajaxToolkit:CalendarExtender 
          runat="server" 
          TargetControlID="txtTo" 
          Format="yyyy-MM-dd" />
      <asp:RequiredFieldValidator 
          runat="server" 
          ControlToValidate="txtTo"
          ErrorMessage="* 請輸入回程日期" ForeColor="Red" />

      <!-- Compare 驗證：回程不得早於出發 -->
      <asp:CompareValidator 
          runat="server"
          ControlToValidate="txtTo"
          ControlToCompare="txtFrom"
          Operator="GreaterThanEqual"
          Type="Date"
          ErrorMessage="* 回程日期必須 >= 出發日期"
          ForeColor="Red" />

      <br /><br />

      <asp:Button runat="server" Text="送出訂票" OnClick="btnBook_Click" />
      <br /><br />
      <asp:Label runat="server" ID="lblMsg" ForeColor="Green" />
    </div>
</div>
  
</asp:Content>

