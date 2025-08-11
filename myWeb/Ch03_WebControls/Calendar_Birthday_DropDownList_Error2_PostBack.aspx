<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar_Birthday_DropDownList_Error2_PostBack.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Calendar_Birthday_DropDownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF3300;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        點選「年」、「月」，直接進行「時光跳躍」。<br />
        建議使用日曆控制項的<span class="auto-style2"><strong> .VisibleDate屬性</strong></span></p>
    <p>
        ===========================================</p>
    <p>
        請輸入您的生日</p>
    <form id="form1" runat="server">
        <p>
            年：<asp:DropDownList ID="DropDownList1" runat="server" style="font-weight: 700; font-size: large; color: #009900">
            </asp:DropDownList>
            <span class="auto-style1"><strong>（寫程式自動產生10年）</strong></span></p>
        <p>
            <span class="auto-style1"><strong>（每一次PostBack，這裡產生的「年份」會不斷重複出現）</strong></span></p>
        <p>
            &nbsp;</p>
        <p>
            月：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
            </asp:DropDownList>
            (AutoPostBack = true)</p>
        <p>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <WeekendDayStyle BackColor="#FFFFCC" />
            </asp:Calendar>
            <br />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000; font-size: large"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            相關範例：<a href="http://msdn.microsoft.com/zh-tw/library/8k0f6h1h(v=vs.100).aspx">http://msdn.microsoft.com/zh-tw/library/8k0f6h1h(v=vs.100).aspx</a></p>
    <div>
    
    </div>
    </form>
</body>
</html>
