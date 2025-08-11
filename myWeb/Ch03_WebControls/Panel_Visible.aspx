<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Panel_Visible.aspx.cs" Inherits="_Book_New_Samples_Panel_Panel_Visible" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #666666;
        }
        .style2
        {
            color: #FFFFFF;
        }
        .style3
        {
            color: #CCCCCC;
        }
        .style4
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>障眼法</strong> -- Panel的「<strong>Visible屬性</strong>」<br />
        <br />
        <br />
        問卷題目 1：<br />
        <br />
        <strong>請問您的性別 --</strong>&nbsp;&nbsp; (<span class="style1"><strong>RadioButtonList，請設定
            AutoPostBack = true</strong></span>）<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <span class="style1">以下有兩個 Panel，預設都是「隱形、看不見」。 <strong>Visible屬性請設定為 false。</strong></span>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" Visible="False">
            Panel1 -- 當您選擇「男」，就會出現這一區的問題：<br />
            <br />
            <strong>請問您當兵了沒？</strong>&nbsp;&nbsp; (<span class="style1"><strong>RadioButtonList，請設定
                AutoPostBack = true</strong></span>）<br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                onselectedindexchanged="RadioButtonList2_SelectedIndexChanged">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <blockquote>
                如果您選 Yes（已經當過兵，）<strong>下面 Panel3（<span class="style4">巢狀Panel</span>）</strong>會詢問您軍種：
                <asp:Panel ID="Panel3" runat="server" BackColor="#0000CC" Visible="False">
                    <span class="style2">== Panel3 ==<br />
                        ===========================================</span><br class="style2" />
                    <strong><span class="style2">請問您當過的軍種：</span><span class="style3">(<span class="style3">請設定
                        AutoPostBack = true）</span></strong><br />
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>陸軍</asp:ListItem>
                        <asp:ListItem>海軍</asp:ListItem>
                        <asp:ListItem>空軍</asp:ListItem>
                        <asp:ListItem>海軍陸戰隊</asp:ListItem>
                        <asp:ListItem>憲兵</asp:ListItem>
                        <asp:ListItem>海巡</asp:ListItem>
                        <asp:ListItem>替代役</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <span class="style2">===========================================</span></span></asp:Panel>
            </blockquote>
        </asp:Panel>
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" BackColor="#FFCCFF" Visible="False">
            Panel2 -- 當您選擇「女」，就會出現這一區的問題：<br />
            <br />
            ........（省略）......
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" 
                onselectionchanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
        </asp:Panel>
        <br />
        <br />
    </div>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #990099"></asp:Label>
    </form>
</body>
</html>
