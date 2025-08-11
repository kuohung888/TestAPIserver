<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList_Sender_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_sender_DropDownList_Sender_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #0000FF;
        }
        .auto-style2 {
            color: #009900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <br />
        <br />兩個下拉式選單，指向同一個事件（使用 <span class="auto-style2"><strong>sender</strong></span>與 <span class="auto-style1"><strong>Request搭配 UniqueID屬性</strong></span>兩種作法）
        <br />
        第一個：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>A111</asp:ListItem>
            <asp:ListItem>A222</asp:ListItem>
            <asp:ListItem>A333</asp:ListItem>
            <asp:ListItem>A444</asp:ListItem>
            <asp:ListItem>A555</asp:ListItem>
        </asp:DropDownList>
&nbsp;(AutoPostBack)<br />
        <br />
            第二個：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>B-111</asp:ListItem>
            <asp:ListItem>B-222</asp:ListItem>
            <asp:ListItem>B-333</asp:ListItem>
            <asp:ListItem>B-444</asp:ListItem>
            <asp:ListItem>B-555</asp:ListItem>
        </asp:DropDownList>
&nbsp;(AutoPostBack)<br />
        <br />
    </div>
    </form>
</body>
</html>
