<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_No_Select_02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_No_Select_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style2 {
            color: #FF0000;
        }
        .auto-style1 {
            font-size: small;
        }
        .auto-style3 {
            background-color: #FFFF00;
        }
        </style>
</head>
<body>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
    <div>
        <span class="auto-style2"><strong>Q：如果下拉式選單，故意不挑選，該如何警示？&nbsp; #02</strong></span><br />
        <br />
    
        <br />
        測試用：
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="0">未選取</asp:ListItem>
            <asp:ListItem Value="1111_Vaue">1111</asp:ListItem>
            <asp:ListItem Value="2222_Vaue">2222</asp:ListItem>
            <asp:ListItem Value="3333_Vaue">3333</asp:ListItem>
            <asp:ListItem Value="4444_Vaue">4444</asp:ListItem>
        </asp:DropDownList>
        (AutoPostBack)<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator未選取！" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        </div>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click" />
        </p>
    <p class="auto-style1">
        =====================================================</p>
        <p class="auto-style1">
            &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem Value="0">未選取</asp:ListItem>
            <asp:ListItem Value="X111_Vaue">X111</asp:ListItem>
            <asp:ListItem Value="X222_Vaue">X222</asp:ListItem>
            <asp:ListItem Value="X333_Vaue">X333</asp:ListItem>
            <asp:ListItem Value="X444_Vaue">X444</asp:ListItem>
        </asp:DropDownList>
        (沒有設定AutoPostBack)
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="RequiredFieldValidator未選取！" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        </p>
        <p>
        <asp:Button ID="Button2" runat="server" Text="Button2" OnClick="Button2_Click" />
        </p>
    <div>
    
        <br />
        <br />
        解決方法：<br />
        第一，DropDownList加入一個子選項，Text設定為「未選取」，<strong><span class="auto-style3">Value設定為0</span></strong><br />
        第二，驗證控制項（RequiredField），並設定 <strong><span class="auto-style3">InitialValue = 0</span></strong></div>
    </form>
</body>
</html>
