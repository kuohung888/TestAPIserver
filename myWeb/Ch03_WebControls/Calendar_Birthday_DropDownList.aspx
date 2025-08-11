<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar_Birthday_DropDownList.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Calendar_Birthday_DropDownList" %>

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
            年：<asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <span class="auto-style1"><strong>（寫程式自動產生100年 / PostBack）</strong></span></p>
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
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" Width="350px" OnSelectionChanged="Calendar1_SelectionChanged" BorderWidth="1px" NextPrevFormat="FullMonth">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle VerticalAlign="Bottom" Font-Bold="True" Font-Size="8pt" ForeColor="#333333" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" Font-Bold="True" BorderWidth="4px" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
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
