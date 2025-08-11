<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04_2_JavaScript.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_4_2_JavaScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch3 --按下此按鈕，就會出現一個 JavaScript寫的警告視窗。</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    按下此按鈕，就會出現一個 JavaScript寫的警告視窗。
    <br /><br />
        1. 填寫完資料，請把滑鼠移到畫面空白處，按下。<br />
        便會觸發 TextBox1_TextChanged事件。<br />
    <br />
        欄位一：<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" 
            ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        <strong>(AutoPostBack屬性 =True)</strong><br />
        <br />
        <br />
        2. 完成後，按下 Button按鈕。<br />
        觸發 Button1_Click事件。<br />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />    
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="Label" 
            Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label" 
            Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" ForeColor="#009900"></asp:Label>
        <br />
    </div>
    </form>
 
 
</body>
</html>

