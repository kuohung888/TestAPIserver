<%@ Page Language="C#" AutoEventWireup="true" CodeFile="0.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_MIS2000Lab_book_image_0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        簡單的練習。<br />
        每一個在畫面上設定的「屬性」，都可以在<b>後置程式碼</b>裡面<span class="style1">動態地</span>變更他的值。</div>
    <p>
        <asp:TextBox ID="TextBox1" runat="server">預設值（Default Value）</asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    </p>
    </form>
</body>
</html>
