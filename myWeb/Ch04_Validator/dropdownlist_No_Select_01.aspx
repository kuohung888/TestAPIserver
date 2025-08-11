<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_No_Select_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_No_Select" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br /><br /><br />
        <span class="auto-style2"><strong>Q：如果下拉式選單，故意不挑選，該如何警示？&nbsp;&nbsp; #01</strong></span><br />
        預設的狀況下，按下按鈕都會出現「第一個子選項」？？
        <br />
    
        <br />
        測試用：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="1111_Vaue">1111</asp:ListItem>
            <asp:ListItem Value="2222_Vaue">2222</asp:ListItem>
            <asp:ListItem Value="3333_Vaue">3333</asp:ListItem>
            <asp:ListItem Value="4444_Vaue">4444</asp:ListItem>
        </asp:DropDownList>
        (AutoPostBack)</div>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click" />
        </p>
    <p class="auto-style1">
        =================================================================</p>
        <p> &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem Value="X111_Vaue">X111</asp:ListItem>
            <asp:ListItem Value="X222_Vaue">X222</asp:ListItem>
            <asp:ListItem Value="X333_Vaue">X333</asp:ListItem>
            <asp:ListItem Value="X444_Vaue">X444</asp:ListItem>
        </asp:DropDownList>
        (沒有設定AutoPostBack)</p>
        <p>
        <asp:Button ID="Button2" runat="server" Text="Button2" OnClick="Button2_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
            <p class="auto-style1">
        ==================================================================</p>
        <p class="auto-style3">
            <strong>.SelectedIndex = -1 表示「未選取」</strong></p>
        <p class="auto-style3">
            <strong>只有 RadioButtonList、CheckoxList與ListBox三者有效！DropDownList無效！</strong></p>
        <p> 
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="R111_Vaue">R111</asp:ListItem>
                    <asp:ListItem Value="R222_Vaue">R222</asp:ListItem>
                    <asp:ListItem Value="R333_Vaue">R333</asp:ListItem>
                    <asp:ListItem Value="R444_Vaue">R444</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Button3" />
            <asp:Label ID="Label1" runat="server" style="color: #990033"></asp:Label>
        </p>
        </div>
    </form>
    <p>
        &nbsp;</p>

</body>
</html>
