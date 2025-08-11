<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Binary.aspx.cs" Inherits="Ch17_File_File_Binary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>File 範例_ Binary</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        範例 File_Binary.aspx<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="將文字寫入現有的檔案（MIS2000Lab_TestFile3.txt）中"
            OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
