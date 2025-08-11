<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page_3.aspx.cs" Inherits="Ch15_Page_3" UICulture="Auto" Culture="Auto" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>第二種寫法 #1</title>
    <style type="text/css">

        .style2
        {
            font-weight: bold;
            background-color: #FFFF99;
            color: #0000FF;
        }
        .style3
        {
            color: #0000FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Cross-Page Posting <b>第二種寫法</b> #1</p>
            <p>
                <span class="style3">請您</span><span class="style2">先點選一個日期</span><span
                    class="style3">後，再來按下按鈕！</span>
            </p>
            <p>
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC"
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest"
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px"
                    ShowGridLines="True" Width="220px">
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt"
                        ForeColor="#FFFFCC" />
                </asp:Calendar>
                <asp:Button ID="Button1" runat="server" Text="Button1_日期出現在下面的TextBox"
                    OnClick="Button1_Click" />
            </p>
            <p>
                您剛剛選擇的日期是：<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            </p>
            <p>
                <hr />
                <asp:Button ID="Button2" runat="server" PostBackUrl="Page_4.aspx" Text="Button2_日期出現在下一頁（Page_4.aspx）" />
            </p>
        </div>
    </form>

</body>
</html>
