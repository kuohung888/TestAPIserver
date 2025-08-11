<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_03_Session.aspx.cs" Inherits="Book_Sample_User_Control_Default" %>

<!-- '** 重點在此！！ ************ -->
<%@ Register Src="WebUserControl_03_Session.ascx" TagName="GridView1" TagPrefix="mis2000lab" %>

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
        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            color: #FF0000;
        }
        .style4
        {
            font-size: xx-large;
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
        每一頁出現幾列記錄？<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">請選擇 -- </asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <br />
        <br />
        <b>********&nbsp; 以下是 User Control&nbsp; (</b><span class="style1">WebUserControl_01.ascx</span><b>) ********<br />
        <br />
        &lt;mis2000lab:GridView1 runat=&quot;server&quot; ID=&quot;mis2000GV&quot; 
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style2">YesOrNo_AllowPaging=&quot;True&quot; NumOfPageSize=&quot;<span 
            class="style4">7</span>&quot;</span> /&gt;&nbsp; <span class="style3">
        改變了UC本身的預設值</span></b><br />
        <br />

        <!-- '** 重點在此！！ ************ -->
        <mis2000lab:GridView1 runat="server" ID="mis2000GV" NumOfPageSize="7" YesOrNo_AllowPaging="true" />

    </div>
    </form>
</body>
</html>
