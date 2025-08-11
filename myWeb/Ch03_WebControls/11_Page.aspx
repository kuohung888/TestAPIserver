<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_Page.aspx.cs" Inherits="Ch03_WebControls_11_Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    本網頁<span class="style1">"沒有"</span>PlaceHolder控制項<br />
    <span class="style2">(直接加入網頁裡面) </span>
    <div>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="按下去，看看結果有何改變 (直接加入網頁裡面)" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
