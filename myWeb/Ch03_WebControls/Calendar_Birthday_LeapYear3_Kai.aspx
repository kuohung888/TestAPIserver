<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar_Birthday_LeapYear3_Kai.aspx.cs" Inherits="Ch03_WebControls_Calendar_Birthday_LeapYear3_Kai" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        是否為潤年？&nbsp; ex:1992 / 1996 / 2000 / 2004 / 2008<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.datetime.isleapyear(v=vs.110).aspx">http://msdn.microsoft.com/zh-tw/library/system.datetime.isleapyear(v=vs.110).aspx</a>
        <br />
        <br />
        這裡採用Kai的想法，想知道某年的某月有幾天，那麼就抓下個月的1日減1天，便知道某年的某月最後一天是幾日<br />
        詳細邏輯請參考 DropDownList2_SelectedIndexChanged()<br />
        <br />
        年：<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        月：<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
&nbsp;(AutoPostBack，點選後，產生當月天數)<br />
        <br />
        日：<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;(AutoPostBack，把結果呈現在Label1)</div>
        <p>
            ===============================</p>
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #0000FF"></asp:Label>
    </form>
</body>
</html>
