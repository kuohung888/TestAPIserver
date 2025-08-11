<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComboBox_CS.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ComboBox_CS" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <strong><span class="auto-style1">ComboBox</span> = DropDownList + TextBox</strong><br />
        <br />
        1. 請選擇:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>111</asp:ListItem>
            <asp:ListItem>222</asp:ListItem>
            <asp:ListItem>333</asp:ListItem>
            <asp:ListItem>444</asp:ListItem>
            <asp:ListItem>555</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<span class="auto-style2">(AutoPostBack = &quot;true&quot;)</span><br />
        <br />
        2. 可修改文字:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #CC0000"></asp:Label>

    </div>
    </form>
</body>
</html>
