<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page_PostBack.aspx.cs" Inherits="Ch15_Page_PostBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>測試 !Page.IsPostBack（網頁第一次被執行）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            為了測試 <span class="style1">!</span>Page.IsPostBack（網頁第一次被執行），<br />
            隨便輸入：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit/送出"
            OnClick="Button1_Click" />
            <br />

        </div>
    </form>

</body>
</html>
