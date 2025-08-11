<%@ Page Language="C#" AutoEventWireup="true" CodeFile="09_Multi_Upload_HttpPostedFile.aspx.cs" Inherits="Ch18_FileUpload_9_Multi_Upload_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>最老舊的寫法，源自微軟MSDN</title>
    <style type="text/css">
        .style1
        {
            color: #FFFFCC;
            font-weight: bold;
            background-color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
        最老舊的寫法，源自微軟MSDN<br />
        市面上的 ASP.NET入門書，只能提供這種解法而已。<br />
        <br />
        <br />
        大量檔案，批次上傳&nbsp; / <span class="style1">傳統作法</span><br />
        <hr />
        1.
        <input id="File1" runat="server" type="file" /><br />
        2.
        <input id="File2" runat="server" type="file" /><br />
        3.
        <input id="File3" runat="server" type="file" /><br />
        4.
        <input id="File4" runat="server" type="file" /><br />
        5.
        <input id="File5" runat="server" type="file" /><br />
        <hr />
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server"
            Text="Multi-Files ~ UPLOAD!  大量檔案，批次上傳！" OnClick="Button1_Click" />

    </div>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
    </p>
    </form>
</body>
</html>
