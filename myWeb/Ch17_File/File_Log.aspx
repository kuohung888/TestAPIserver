<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Log.aspx.cs" Inherits="Ch17_File_File_Log" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>File Log #1</title>
    <style type="text/css">
        .style1
        {
            color: #800000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            background-color: #99FF66;
        }
        .style3
        {
            background-color: #99FF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span class="style1">File Log #1<br />
            <br />
        </span>本程式寫在 Page_Load事件裡面。
        <br />
        執行完畢後，請自己到 <span class="style3">C:\MIS2000Lab_ASP.NET_Log</span><span class="style2">\目錄</span>下查看結果。<hr />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
