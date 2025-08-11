<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_4.aspx.cs" Inherits="Ch17_File_File_4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        把 Path1路徑的檔案，進行「讀取」、「複製」到 Path2，然後再做「刪除」的動作。<br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="開始動作！" />
    </div>
    </form>
</body>
</html>
