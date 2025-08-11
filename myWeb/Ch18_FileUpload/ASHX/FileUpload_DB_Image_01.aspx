<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_Image_01.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_Image_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        FileUpload 檔案上傳，將圖片以「二進位」存入資料表的 Image欄位格式<br />
        <br />
        (範例資料表 -- FileUpload_DB2 有兩個欄位，做了異動)<br />
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_將圖片以「二進位」存入資料表" />
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label1" runat="server" style="color: #0066FF; font-weight: 700"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        資料來源：<br />
        微軟msdn -- <a href="http://msdn.microsoft.com/zh-tw/library/system.web.httppostedfile.inputstream(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/system.web.httppostedfile.inputstream(v=vs.110).aspx</a>
        <br />
        F6 Puma -- <a href="http://www.dotblogs.com.tw/puma/archive/2008/03/10/1316.aspx">http://www.dotblogs.com.tw/puma/archive/2008/03/10/1316.aspx</a>
    </form>
</body>
</html>
