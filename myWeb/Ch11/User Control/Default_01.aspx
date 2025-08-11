<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_01.aspx.cs" Inherits="Book_Sample_User_Control_Default_01" %>

<!-- '** 重點在此！！ ************ -->
<%@ Register Src="WebUserControl_01.ascx" TagName="GridView1" TagPrefix="mis2000lab" %>
<!-- '** 重點在此！！ ************ -->




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
    
        GridView是否可以分頁（AllowPaging）？<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Value="True">Yes</asp:ListItem>
            <asp:ListItem Value="False">No</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <br />
        <br />
        <b>********&nbsp; 以下是 User Control&nbsp; (</b><span class="style1">WebUserControl_01.ascx</span><b>) ********</b><br />
        <br />

        <!-- '** 重點在此！！ ************ -->
        <mis2000lab:GridView1 runat="server" ID="mis2000GV"  />

    </div>
    </form>
</body>
</html>
