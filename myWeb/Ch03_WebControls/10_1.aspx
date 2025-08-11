<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10_1.aspx.cs" Inherits="Ch03_WebControls_10_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3 </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        請透過下列的日曆控制項，<br />
        來點選日期：<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        &nbsp;<br />
    </div>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
        BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
        ForeColor="#663399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged"
        ShowGridLines="True">
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <DayHeaderStyle BackColor="#FFCC66" Height="1px" Font-Bold="True" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
    </asp:Calendar>
    </form>
</body>
</html>
