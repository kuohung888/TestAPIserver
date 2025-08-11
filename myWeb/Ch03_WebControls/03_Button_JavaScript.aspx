<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03_Button_JavaScript.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_3_Button_JavaScript" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        Button與 JavaScript<br />
    
        <br />
        <asp:Button ID="Button2" runat="server" 
            onclientclick="javascript:window.alert(&quot;Hello!The World!&quot;)" 
            Text="Button" />
        <br />
        <br />
        <a href="03_Button_HistoryBack.aspx">連結到下一頁</a><br />
        <br />
        
    
    </div>
    </form>
</body>
</html>
