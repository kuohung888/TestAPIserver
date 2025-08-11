<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add_Multiple_0_Easy.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_0_Easy" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>手動新增一個選項（簡易版）--可複選、程式簡單、可移動ListItem（文字、值）</title>
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
            把兩個 ListBox裡面的子選項，左右搬動<strong><span class="style3">&nbsp;&nbsp; 簡易版、可複選&nbsp;&nbsp; </span></strong>
            <br />
            <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx</a>
            <br />
            <br />
            感謝 2012/10/7（週日班）兩位學員的指正與分享。<br />
            <br />
            <span class="style2">注意！！<br />
                (1). 利用反迴圈（for迴圈 改用 <strong>由大到小</strong>）來執行，可以解決「複選」的問題。<br />
                (2). 移動子選項時，直接使用 ListBox.Item(i).Add()，可以直接移動子選項（Text文字、Value值可分開）<br />
                (3). for迴圈裡面，不需要 Exit For或是 break;語法，也能作！</span><br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px" SelectionMode="Multiple">
                <asp:ListItem Value="左一(Value)">左一</asp:ListItem>
                <asp:ListItem Value="左二(Value)">左二</asp:ListItem>
                <asp:ListItem Value="左三(Value)">左三</asp:ListItem>
            </asp:ListBox>

            &nbsp;（複選）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px" SelectionMode="Multiple">
            <asp:ListItem Value="右A(Value)">右A</asp:ListItem>
            <asp:ListItem Value="右B(Value)">右B</asp:ListItem>
            <asp:ListItem Value="右C(Value)">右C</asp:ListItem>
        </asp:ListBox>

            （複選）<br />
            <asp:Button ID="Button1" runat="server" Text="Button 1 右移==&gt;" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="&lt;==Button 2 左移" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
            其實這個範例也是一種「<span class="style1">手動新增</span>一個子選項」
        </div>
    </form>

</body>
</html>
