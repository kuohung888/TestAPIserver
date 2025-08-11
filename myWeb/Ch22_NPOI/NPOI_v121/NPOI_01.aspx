<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_01.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        本範例的資料來源：<a href="http://msdn.microsoft.com/zh-tw/ee818993.aspx">http://msdn.microsoft.com/zh-tw/ee818993.aspx</a>
        <br />
        <br />
    
        <br />
        <asp:Button ID="Button1" runat="server" Text="生成一個空白的 Excel 檔案，並且添加三個指定名稱的試算表" 
            onclick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
