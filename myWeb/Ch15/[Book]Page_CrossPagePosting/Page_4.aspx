<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page_4.aspx.cs" Inherits="Ch15_Page_4" %>


<%@ PreviousPageType VirtualPath="Page_3.aspx" %>
<!-- 上面這一行是 [重點] ！！！！！ -->



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>第二種寫法 #2</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            background-color: #FFFF66;
        }
        .style2
        {
            color: #0033CC;
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>Cross-Page Posting <b>第二種寫法</b> #2</p>
        <div>
            本程式需搭配 Page_3.aspx<br />
            程式上方，需要加寫一行--<span class="style1">&lt;%</span><span class="style2">@ 
        PreviousPageType</span><span class="style1"> VirtualPath=&quot;Page_3.aspx&quot;%&gt;</span><br />
            <br />
            從 Page_3.aspx傳來的日期：<asp:Label ID="Label1" runat="server" Font-Bold="True"
                ForeColor="Red" Text="Label"></asp:Label>

        </div>
    </form>

</body>
</html>

