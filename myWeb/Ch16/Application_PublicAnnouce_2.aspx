<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="Application_PublicAnnouce_2.aspx.cs" Inherits="Book_Sample_Ch16_Application_PublicAnnouce_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <font color="red">
            <!-- *** 重點在此！！******************** -->
            <% 
                String a = Application["PublicMessage"].ToString();
                Response.Write(a);
                %>


        記得把 Global.asax放到網站的「根目錄」底下</font><br />


        <br />
        <br />
        =========== 以下是一般的網頁內容 ========================<br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White"
            BorderColor="#3366CC" BorderWidth="1px" CellPadding="1"
            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
            ForeColor="#003399" Height="200px" Width="220px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px"
                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
        <br />

    </div>
    </form>
</body>
</html>

