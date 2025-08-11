<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_JavaScript_Alert.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Button_JavaScript_Alert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>按下此按鈕，就會出現一個 JavaScript寫的警告視窗。</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" 
            onclientclick="window.alert(&quot;警告視窗！&quot;);" Text="Button" />
        <br />
        <br />
        <br />
        按下此按鈕，就會出現一個 JavaScript寫的警告視窗。</div>
    </form>
</body>
</html>