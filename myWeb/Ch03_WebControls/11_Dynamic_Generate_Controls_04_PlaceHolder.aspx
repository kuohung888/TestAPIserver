<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_Dynamic_Generate_Controls_04_PlaceHolder.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_03_PlaceHolder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            background-color: #66CCFF;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div>
    
        === 動態產生控制項 === <strong><span class="auto-style1">（PlaceHolder）搭配 Request來作，成功！</span></strong><br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" style="color: #0000FF">
            <asp:ListItem Value="1">單選</asp:ListItem>
            <asp:ListItem Value="2">複選</asp:ListItem>
            <asp:ListItem Value="3">文字輸入</asp:ListItem>
        </asp:RadioButtonList>
        <span class="auto-style2"><strong>(AutoPostBack = true)</strong></span><br />
    

        <p>
            ==================================================================</p>

    
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    

        <p>
            ==================================================================</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_按下後，可抓到動態問卷的「值」" />
        </p>
    </div>
    </form>

</body>
</html>
