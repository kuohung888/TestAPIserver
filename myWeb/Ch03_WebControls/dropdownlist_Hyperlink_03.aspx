<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_Hyperlink_03.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_Hyperlink_03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            font-weight: bold;
            background-color: #99FF99;
        }
        .style3
        {
            font-weight: bold;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">改良版 #3：</span><br />
        <br />
        <br />
    
        點選後，便可以超連結到其他網站：<asp:DropDownList 
            ID="DropDownList1" runat="server" >
            <asp:ListItem Value="www.sina.com">Sina</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw">DotBlogs</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw/mis2000lab/">MIS2000 Lab.</asp:ListItem>
            <asp:ListItem Value="www.find.org.tw">III-FIND</asp:ListItem>
        </asp:DropDownList>
    
    &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Button" />
        <br />
        <br />
        （<span class="style3">不</span>啟動了 <b>AutoPostBack屬性</b>。<br />
&nbsp;&nbsp;&nbsp; <span class="style3">不</span>用作第一個「請選擇--」選項<br />
&nbsp;&nbsp;&nbsp; <b><span class="style1">改善第一個範例</span>的缺點：第一個選項，在第一次不能被點選到</b>）</div>
    </form>
</body>
</html>
