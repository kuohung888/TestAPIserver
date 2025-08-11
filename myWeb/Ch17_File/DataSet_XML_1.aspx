<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataSet_XML_1.aspx.cs" Inherits="Ch17_File_DataSet_XML_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>把 DataSet轉成XML檔案 #1</title>
</head>
<body>
    <p>
        手寫版的程式，把 DataSet轉成XML檔案。</p>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Export To Excel-File" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
