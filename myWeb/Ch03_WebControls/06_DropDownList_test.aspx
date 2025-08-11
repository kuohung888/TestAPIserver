<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_DropDownList_test.aspx.cs" Inherits="Ch03_WebControls_6_dropdownlist_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #CC3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        請選擇：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>科技</asp:ListItem>
            <asp:ListItem>政治</asp:ListItem>
            <asp:ListItem Value="NEW_ITEM">我要手動新增一個選項</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; <span class="style1">(設定為AutoPostBack，所以不需要按鈕)</span><br />
        <br />
        <br />
        <span class="style2">
            <br />
            <br />
            下面的東西，用 Panel包裝起來，設定為看不見(Panel1.Visible=False)，讓畫面美觀。</span><br />
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        請輸入新的選項：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </asp:Panel>
    </form>
</body>
</html>
