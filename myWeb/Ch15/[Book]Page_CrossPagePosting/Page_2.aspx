<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page_2.aspx.cs" Inherits="Ch15_Page_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cross-Page Posting #2</title>
</head>
<body>
    <p>Cross-Page Posting (跨網頁張貼)#2</p>

    <form id="form1" runat="server">
        <div>
            本程式需搭配 Page_1.aspx<br />
            <br />
            從 Page_1.aspx傳來的日期：<asp:Label ID="Label1" runat="server" Font-Bold="True"
                ForeColor="Red" Text="Label"></asp:Label>

        </div>
    </form>

</body>
</html>
