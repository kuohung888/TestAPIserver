<%@ Control Language="C#" AutoEventWireup="true" CodeFile="02_UC_AdoNet.ascx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_ADOnet_01_UC" %>
<style type="text/css">
    .auto-style1 {
        color: #0000FF;
    }
</style>

<p>
    ===&nbsp; UC&nbsp;+ ADO.NET&nbsp; ========================================</p>
<p>
    UC裡面設定為「公開屬性（Property）」讓網頁呼叫與使用</p>
文章分類：<asp:Label ID="Label1" runat="server" style="background-color: #99FFCC"></asp:Label>
<br />
<br />
(1).寫在Page_Load事件內，出現錯誤。永遠出現上一次的選取結果。<br />
<asp:Label ID="Label2" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    <br />
    <br />
(2).寫在<span class="auto-style1"><strong>Page_PreRender事件</strong></span>內，正確！<br />
    <asp:Label ID="Label3" runat="server" style="color: #0000FF; font-weight: 700;"></asp:Label>
<p>
    ========================================================</p>

