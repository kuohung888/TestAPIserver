<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page_Life.aspx.cs" Inherits="Book_Sample_Ch15_Page_Life" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">測試 Page的生命週期，與事件發生的前後</span><br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
    
    </div>
    </form>
</body>
</html>
