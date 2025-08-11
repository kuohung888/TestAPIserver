<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_01_old.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表</title>
    <style type="text/css">
        .style1 {
            background-color: #FFCC66;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #FFFFFF;
            background-color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        本範例的資料來源：<a href="http://msdn.microsoft.com/zh-tw/ee818993.aspx">http://msdn.microsoft.com/zh-tw/ee818993.aspx</a> 
        (v1.2.1版）<br />
        <strong><span class="style3">舊的 v.1.2.1版寫法</span></strong>，沒有變動。<br />
        <br />
        <br />
        <span class="style2">請把<strong> /bin目錄</strong>下，<strong>舊版</strong> NPOI的 
        .DLL檔都<strong> [刪除]</strong>以後，再來加入新版本的 .DLL檔。</span><br />
        <br />
        <strong><span class="style1">NPOI v1.2.4版</span></strong><br />
    
        簡體中文教程：<a href="http://tonyqus.sinaapp.com/archives/38">http://tonyqus.sinaapp.com/archives/38</a>
        <br />
    
        <br />
        <asp:Button ID="Button1" runat="server" Text="生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表" 
            onclick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>

