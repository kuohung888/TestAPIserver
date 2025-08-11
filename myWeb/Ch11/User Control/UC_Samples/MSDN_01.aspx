<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MSDN_01.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_MSDN_01" %>

<%@ Register TagPrefix="MIS2000Lab" Tagname="UC" Src="MSDN_UC.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MSDN範例--在 Page_Init事件裡面設定UC的「預設值」。</title>
</head>
<body>
    在 Page_Init事件裡面設定UC的「預設值」。

    <form id="form1" runat="server">
    <div>    

        MaxValue -- <asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; color: #0000FF;" Text="Label"></asp:Label>
        <br />
        MiniValue -- <asp:Label ID="Label2" runat="server" 
            style="font-weight: 700; color: #FF0000;" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
    

    <hr />以下是使用者控制項（UC）-- 檔名MSDN_UC.ascx
    <br /><br />

    <!-- 在包含網頁中, 以宣告方式設定 MinValue  和 MaxValue 屬性
              （這兩個 公開  屬性，已經寫在UC裡面） -->
    <MIS2000Lab:uc ID="Spinner1" runat="server"/>
    <!-- 在 Page_Init事件裡面設定UC的「預設值」。 -->

    </div>
    </form>
</body>
</html>