<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageButton_Panel.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ImageButton_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        <br />按下 Button按鈕（不管是什麼按鈕型態），<span class="style1"><br />
        每按一下，Panel就會開 / 關。......週而復始....</span>
        <hr />  
        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument="0" 
            ImageUrl="企鵝老師.gif" onclick="ImageButton1_Click" />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" BackColor="#FFCCCC" Visible="False">
            Hello....您看見我了！<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 我藏在 Panel控制項裡面。</asp:Panel>
    
    </div>
    </form>
</body>
</html>
