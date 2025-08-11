<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_DropDownList_ComboBox.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_06_DropDownList_ComboBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ASP.NET目前沒有 ComboBox，只有 Windows Form才有。<br />
        <br />
        ComboBox的用法，請參閱：<a href="http://demos.telerik.com/aspnet-mvc/combobox" rel="nofollow"
            target="_blank" title="">http://demos.telerik.com/aspnet-mvc/combobox</a><br />
        <br />
        <br />
        ..................................................................................................................<br />
        <strong><span class="style1">我們使用 DropDownList + TextBox合成一個類似的功能（以前 ASP 是用 JavaScript作的）</span><br
            class="style1" />
            <br class="style1" />
            <span class="style1">(1). 您可以直接輸入TextBox</span><br class="style1" />
            <span class="style1">(2). 或是從 DropDownList挑選以後，再來TextBox修改</span></strong><br />
        <br />
        請輸入：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>項目A</asp:ListItem>
            <asp:ListItem>項目B</asp:ListItem>
            <asp:ListItem>項目C</asp:ListItem>
            <asp:ListItem>項目D</asp:ListItem>
            <asp:ListItem>項目E</asp:ListItem>
            <asp:ListItem>項目F</asp:ListItem>
            <asp:ListItem>項目G</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_ComboBox的輸入" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="color: #009900; font-weight: 700"></asp:Label>
    </div>
    </form>
</body>
</html>
