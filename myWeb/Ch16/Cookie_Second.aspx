<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_Second.aspx.cs" Inherits="Ch16_Cookie_Second" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>第二個網頁（範例 Cookie_Second.aspx）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            background-color: #66CCFF;
        }
        .style3
        {
            color: #FFFFCC;
            font-weight: bold;
            background-color: #33CC33;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <span class="style2">第二個網頁（範例 Cookie_Second.aspx）</span>會嘗試讀取 Cookie。<br />
        <br />
        然後會將瀏覽器<span class="style1">重新導向</span>回第一個網頁（範例 Cookie_First.aspx）<br />
        第一個網頁會出現 QueryString，例如：Cookie_First.aspx<span class="style3">?AcceptsCookies=yes</span>
    </div>
    </form>

</body>
</html>
