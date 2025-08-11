<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01.aspx.cs" Inherits="Ch03_WebControls_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> Ch3 TextBox控制項 </title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
            font-weight: bold;
        }
    .style3
    {
        color: #0000FF;
    }
    .style2
    {
        color: #FF0000;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        欄位一： <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
            ontextchanged="TextBox1_TextChanged">預設值</asp:TextBox>
        &nbsp; &nbsp;(設定 AutoPostBack=&quot;<span class="style3"><strong>True</strong></span>&quot; 。因為畫面上<span 
            class="style2"><strong>沒有 </strong></span>Button按鈕的緣故)<br />
        <br />
        ======================================================<br />
        <br />
        <br />
        <br />
        欄位二： <asp:TextBox ID="TextBox2" runat="server" 
            ontextchanged="TextBox2_TextChanged"></asp:TextBox>
    
        &nbsp; （<span class="style1">沒有</span>設定 AutoPostBack=&quot;True&quot;，需要靠 Button觸發 
        TextChanged事件）<br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    </form>
 
</body>
</html>
