<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_Dynamic_Generate_Controls_03_Error.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_03_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style1 {
            background-color: #FF99CC;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        動態產生控制項 #3 <strong><span class="auto-style1">（PlaceHolder）......有錯！！</span></strong><br />
        <br />
        上一個範例出錯，是因為<strong>按下按鈕之後，重新PostBack</strong>，所以動態產生的控制項都會消失...<br />
        <br />
        本範例改善了上一個的錯誤，但是帶來更多錯誤<br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" style="color: #0066FF">
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
