<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add_Multiple_4_function_ListItem.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_4_function_ListItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            color: #FF66FF;
        }
        .style3
        {
            color: #000000;
        }
        .style4
        {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        前幾支範例的<span class="style1"><strong>缺點</strong></span>：<br />
        (1).&nbsp; <strong>.Add()方法</strong>與 <strong>.Remove()方法</strong>都只能加入<strong>字串</strong>。如果遇見「<span
            class="style4"><strong>子選項（ListItem）</strong></span>」的 Text與 Vlaue不同，就慘了。<br />
        (2). 原本用陣列（Array），本次改用<strong> List(Of T)&nbsp; 與 List&lt;T&gt; </strong>
        <br />
        (3). 上述兩種方法除了「參數」可用<strong>字串</strong>以外，也可以使用 <span class="style4"><strong>子選項（ListItem）</strong></span>來做<br />
        <a href="http://msdn.microsoft.com/zh-tw/library/e7s6873c.aspx">http://msdn.microsoft.com/zh-tw/library/e7s6873c.aspx</a>
        <br />
        <br />
        <br />
        <br />
        把兩個 ListBox裡面的子選項，左右搬動&nbsp; &nbsp;<span class="style3"><strong><span class="style2">複選，成功（副程式）版</span></strong></span><br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx">
            http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx</a>
        <br />
        <br />
        <br />
        <span class="style3">ListBox設定為<strong>「複選」！</strong> SelectionMode屬性 = Multiple。</span><br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px" SelectionMode="Multiple"
            ForeColor="#009900" BackColor="#CCFF99">
            <asp:ListItem>左一</asp:ListItem>
            <asp:ListItem>左二</asp:ListItem>
            <asp:ListItem>左三</asp:ListItem>
        </asp:ListBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px" SelectionMode="Multiple"
            ForeColor="Blue" BackColor="#CCFFFF">
            <asp:ListItem>右A</asp:ListItem>
            <asp:ListItem>右B</asp:ListItem>
            <asp:ListItem>右C</asp:ListItem>
        </asp:ListBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button1 右移==&gt;" 
            onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="&lt;==Button2 左移" 
            onclick="Button2_Click" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
    </div>
    </form>
</body>
</html>
