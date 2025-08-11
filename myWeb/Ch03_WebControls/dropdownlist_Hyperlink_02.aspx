<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_Hyperlink_02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_Hyperlink_02" %>

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
            background-color: #FF9933;
        }
        .style3
        {
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">改良版 #2：</span><br />
        <br />
        <br />
    
        點選後，便可以超連結到其他網站：<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="www.dotblogs.com.tw/mis2000lab/">請選擇----</asp:ListItem>
            <asp:ListItem Value="www.sina.com">Sina</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw">DotBlogs</asp:ListItem>
            <asp:ListItem Value="www.dotblogs.com.tw/mis2000lab/">MIS2000 Lab.</asp:ListItem>
            <asp:ListItem Value="www.find.org.tw">III-FIND</asp:ListItem>
        </asp:DropDownList>
    
    &nbsp;<br />
        <br />
        （啟動了 <b>AutoPostBack屬性</b>。<br />
&nbsp;&nbsp;&nbsp; 必須<span class="style3">自己動手，加入第一個「請選擇--」選項</span>，且要設定預設的URL網址。<br />
&nbsp;&nbsp;&nbsp; <b><span class="style1">改善上一個範例</span>的缺點：第一個選項，在第一次不能被點選到</b>）</div>
    </form>
</body>
</html>
