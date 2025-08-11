<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03_Multi_Button.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_03_Multi_Button" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>多個 Button，共用「同一個事件」</strong> ----&nbsp; <span class="style1"><strong>參數 sender</strong></span>的用法<br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" CommandArgument="Button1" 
            Text="Button1" onclick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" CommandArgument="Button2" 
            Text="Button2" onclick="Button1_Click" />
        <br />
        <br />
        兩個按鈕，<strong>共用<span class="style1">同一個 Button1_Click</span>事件</strong></div>
    </form>
</body>
</html>
