<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_5_Regular_Easy.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_5_Regular_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            color: #3333CC;
            font-size: x-large;
        }
        .auto-style3 {
            color: #3333CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        輸入三個數字「或是」五個數字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="驗證錯誤！RegularExpressionValidator" ForeColor="Red" 
            ValidationExpression="([0-9]{3}|[0-9]{5})"></asp:RegularExpressionValidator>
        
        
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_錯誤版" />
        <br />
        <br />
        <strong>原本規則 有錯誤&nbsp;&nbsp; ([0-9]{3}<span class="auto-style2">|</span>[0-9]{5})</strong><br />
        <br />
        為什麼輸入 123是正確的？<span class="auto-style1"><strong>輸入12345卻報錯誤？？</strong></span><br />
        <br />
        因為12345不符合第一條規則<br />
        <br />
        <br />
        <br />
        請修正為&nbsp; (<span class="auto-style1"><strong>^</strong></span>[0-9]{3}<strong><span class="auto-style1">$</span><span class="auto-style2">|</span></strong><span class="auto-style1"><strong>^</strong></span>[0-9]{5}<span class="auto-style1"><strong>$</strong></span>)&nbsp;
        <br />
        把兩條規則的「頭」「尾」都規定清楚！</div>

        <br />

        <hr />
        <span class="auto-style3"><strong>正確版本！！！
        </strong></span>
        <hr />
                輸入三個數字「或是」五個數字：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="驗證錯誤！RegularExpressionValidator" ForeColor="Red" 
            ValidationExpression="(^[0-9]{3}$|^[0-9]{5}$)"></asp:RegularExpressionValidator>
        
        
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button_正確版本！！！" />


    </form>
</body>
</html>
