<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_Dynamic_Generate_Controls_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Dynamic_Generate_Controls_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        動態產生控制項 #1 <strong><span class="auto-style1">（障眼法）</span></strong><br />
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" style="color: #0066FF">
            <asp:ListItem Value="1">單選</asp:ListItem>
            <asp:ListItem Value="2">複選</asp:ListItem>
            <asp:ListItem Value="3">文字輸入</asp:ListItem>
        </asp:RadioButtonList>
        <span class="auto-style2"><strong>(AutoPostBack = true)</strong></span><br />
    
    </div>
        <p>
            ==================================================================</p>
        <p>
            以下的控制項，都設定為<strong>隱形、看不見（.Visible=false）</strong></p>
        <p>
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" Visible="False">
                <asp:ListItem Value="單選1">單選1</asp:ListItem>
                <asp:ListItem Value="單選2">單選2</asp:ListItem>
                <asp:ListItem Value="單選3">單選3</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" Visible="False">
                <asp:ListItem Value="複選1">複選1</asp:ListItem>
                <asp:ListItem Value="複選2">複選2</asp:ListItem>
                <asp:ListItem Value="複選3">複選3</asp:ListItem>
            </asp:CheckBoxList>
        </p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p>
            ==================================================================</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_按下後，可抓到動態問卷的「值」" />
        </p>
    </form>
</body>
</html>
