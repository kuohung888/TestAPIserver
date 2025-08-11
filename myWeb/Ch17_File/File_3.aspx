<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_3.aspx.cs" Inherits="Ch17_File_File_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>File 範例三</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <hr />
        範例三<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="改用do…while迴圈來讀取檔案內容（MIS2000Lab_TestFile2.txt）"
            OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
