<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Meeting.aspx.cs" Inherits="Meeting" %>

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

    <h2>會議預約範例</h2>
      <!-- 啟用 Ajax 控件 -->
      <asp:ScriptManager runat="server" />
      <div style="margin:20px;  text-align:center" >
        <h3>預約會議行程</h3>
        
        <!-- 會議日期輸入框 -->
        <asp:Label runat="server" Text="選擇會議日期：" AssociatedControlID="txtDate" />
        <asp:TextBox ID="txtDate" runat="server" Width="120px" />
        
        <!-- 日期選擇器 -->
        <ajaxToolkit:CalendarExtender 
            runat="server" 
            TargetControlID="txtDate" 
            Format="yyyy-MM-dd" />

        <!-- 必填驗證 -->
        <asp:RequiredFieldValidator 
            runat="server" 
            ControlToValidate="txtDate"
            ErrorMessage="* 請選擇會議日期"
            ForeColor="Red" />

        <!-- 自訂驗證：不能選過去日期 -->
        <asp:CustomValidator 
            runat="server"
            ID="cvDate"
            ControlToValidate="txtDate"
            ErrorMessage="* 會議日期不能早於今天"
            ForeColor="Red"
            OnServerValidate="cvDate_ServerValidate" />

        <br /><br />
        <!-- 送出按鈕 -->
        <asp:Button 
            runat="server" 
            Text="提交預約" 
            OnClick="btnSubmit_Click" />
        
        <!-- 成功訊息 -->
        <asp:Label 
            runat="server" 
            ID="lblResult" 
            ForeColor="Green" 
            Font-Size="Large" />
      </div>
    </div>
</asp:Content>

