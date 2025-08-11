<%@ Page Language="C#" AutoEventWireup="true" CodeFile="counter.aspx.cs" Inherits="Ch17_File_counter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>訪客計數器 -- Counter</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        訪客計數器（<span class="style1">圖片版</span>）----
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
