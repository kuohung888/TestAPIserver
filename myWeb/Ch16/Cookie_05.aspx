<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_05.aspx.cs" Inherits="Ch16_Cookie_05" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            font-weight: bold;
            font-size: small;
            color: #0066FF;
            background-color: #FF9933;
        }
        .style3
        {
            font-size: small;
            color: #0066FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        如果 Cookie裡面有「子索引鍵」，就會將子索引鍵顯示為
        <b>單一 <span class="style1">名稱/值 </span>字串 </b>。  
        <br />
        （建議您事先執行過前面的範例，如 Cookie_02.aspx）<br />
        <br />
        <br />

    </div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </form>



</body>
</html>
