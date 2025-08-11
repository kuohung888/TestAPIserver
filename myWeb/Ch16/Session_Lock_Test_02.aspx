<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Lock_Test_02.aspx.cs" Inherits="Book_Sample_Ch16_Session_Lock_Test_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Session_Lock_Test_02.aspx<br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0000"></asp:Label>
        <br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC"
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest"
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px"
            ShowGridLines="True" Width="220px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt"
                ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>

    </div>
    </form>
</body>
</html>
