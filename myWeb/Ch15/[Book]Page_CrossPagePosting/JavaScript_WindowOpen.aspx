<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JavaScript_WindowOpen.aspx.cs" Inherits="Book_Sample_Ch15__Book_Page_CrossPagePosting_JavaScript_WindowOpen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        window.open(&#39; 新視窗的網址 &#39;, &#39;新視窗的標題&#39;, config=&#39;height=高度,width=寬度&#39;);<br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClientClick="window.open('Page_1X.aspx', '新視窗的標題', config='height=500,width=400');" Text="Button_JavaScript開一個新視窗" />
        <br />
        <br />
        請善用 On<span class="auto-style1"><strong>Client</strong></span>Click屬性</div>
    </form>
</body>
</html>
