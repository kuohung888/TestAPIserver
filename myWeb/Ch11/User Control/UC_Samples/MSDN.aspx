<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MSDN.aspx.cs" Inherits="MSDN" %>

<%@ Register TagPrefix="MIS2000Lab" Tagname="UC" Src="MSDN_UC.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>MSDN範例</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   
    <hr />以下是使用者控制項（UC）-- 檔名MSDN_UC.ascx
    <br /><br />

    <!-- 在包含網頁中, 以宣告方式設定 MinValue  和 MaxValue 屬性
          （這兩個 公開屬性，已經寫在UC裡面） -->
    <MIS2000Lab:uc ID="Spinner1" runat="server" MinValue="0" MaxValue="10" />

    </div>
    </form>
</body>
</html>
