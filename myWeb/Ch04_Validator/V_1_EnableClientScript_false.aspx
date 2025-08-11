<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_1_EnableClientScript_false.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_1_EnableClientScript_false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>RequiredField（必填）<br />
        <br />
        驗證控制項的「EnableClientScript」屬性。手動修改為 false。<br />
        您會發現：<br />
&nbsp;&nbsp;&nbsp; </strong>按下按鈕，<strong>整個畫面會</strong><span class="style1"><strong>重新整理</strong></span>，瀏覽器底下的<strong>「狀態列」會重新跑一次</strong>，與 
        Web Server傳一次資料。<br />
&nbsp;&nbsp;&nbsp;&nbsp; 然後才會出現驗證成果。這代表是<span class="style1"><strong>後端的</strong></span><strong> 
        ASP.NET語法在進行驗證</strong>。<br />
        <br />
        請輸入任何文字：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" 
            ErrorMessage="RequiredFieldValidator" 
            ForeColor="Red" SetFocusOnError="True" EnableClientScript="False"></asp:RequiredFieldValidator>
        <br />
        <br />
        對照組：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit(送出)" />
    
    </div>
    </form>
 
</body>
</html>
