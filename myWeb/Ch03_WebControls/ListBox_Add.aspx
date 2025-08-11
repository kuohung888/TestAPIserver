<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add.aspx.cs" Inherits="Ch03_WebControls_ListBox_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>手動新增一個選項（只能單選）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        把兩個 ListBox裡面的子選項，左右搬動（只能單選）<br />
        <br />
        <span class="style2">注意！！ListBox<strong><span class="style3">不</span></strong>能設定為<strong>「複選」！ 
        SelectionMode屬性 = <span class="style3">Single</span>才行。</strong></span><br />
        <br />

        <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px">
            <asp:ListItem>左一</asp:ListItem>
            <asp:ListItem>左二</asp:ListItem>
            <asp:ListItem>左三</asp:ListItem>
        </asp:ListBox>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px">
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
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
        其實這個範例也是一種「<span class="style1">手動新增</span>一個子選項」<br />
        <br />
        <br />
        ***************************************************************************<br />
        範例 <strong>ListBox_Add_<span class="style2">Multiple_0_Easy</span>.aspx</strong>是比較好的解法，可以複選、程式碼也簡單！！<br />
        ***************************************************************************</div>
    </form>
 
</body>
</html>