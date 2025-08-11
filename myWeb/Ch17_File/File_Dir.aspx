<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Dir.aspx.cs" Inherits="Ch17_File_File_Dir" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>讀取電腦 C:\ 底下的所有檔案與檔案容量大小</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        範例 file_dir.aspx<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="用for迴圈來讀取電腦 C:\ 底下的所有檔案與檔案容量大小" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
