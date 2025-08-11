<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="highlight_system.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button
            ID="Button1"
            runat="server"
            Text="測試連線並查詢前 200 筆"
            OnClick="Button1_Click" />

        <asp:GridView
            ID="GridView1"
            runat="server"
            AutoGenerateColumns="true"
            EmptyDataText="查無資料"
            Width="100%" />
    </form>
</body>
</html>
