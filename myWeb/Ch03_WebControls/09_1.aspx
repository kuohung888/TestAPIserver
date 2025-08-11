<%@ Page Language="C#" AutoEventWireup="true" CodeFile="09_1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_9_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CH 3 </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        請透過下列的日曆控制項，<br />
        來點選日期：<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
    </div>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
        BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
        Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <WeekendDayStyle BackColor="#CCCCFF" />
        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
            Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
    </asp:Calendar>
    </form>
</body>
</html>
