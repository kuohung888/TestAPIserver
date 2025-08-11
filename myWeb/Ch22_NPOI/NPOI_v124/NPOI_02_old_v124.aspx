<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_02_old_v124.aspx.cs" Inherits="Book_Sample_Ch11_NOPI_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>在 試算表的Sheet裡面 添加資料</title>
    <style type="text/css">

        .style2
        {
            color: #FF0000;
        }
        .style1 {
            background-color: #FFCC66;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">請把<strong> /bin目錄</strong>下，<strong>舊版</strong> NPOI的 
        .DLL檔都<strong> [刪除]</strong>以後，再來加入新版本的 .DLL檔。</span><br />
        <br />
        <strong><span class="style1">NPOI v1.2.4版</span></strong>
        <br />

        <asp:Button ID="Button1" runat="server" Text="在 試算表的Sheet裡面 添加資料" 
            onclick="Button1_Click" />
        </div>
    </form>
</body>
</html>
