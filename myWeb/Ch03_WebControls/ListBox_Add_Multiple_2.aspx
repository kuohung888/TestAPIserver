<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add_Multiple_2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>手動新增一個選項 #2</title>
    <style type="text/css">
        .style2
        {
            color: #0000FF;
        }
        .style3
        {
            color: #FFFFFF;
        }
        .style4
        {
            background-color: #0000FF;
        }
        .style5
        {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        把兩個 ListBox裡面的子選項，左右搬動&nbsp; &nbsp;<span class="style3"><strong><span 
            class="style4">複選，成功版</span></strong></span><br />
        <br />
        <span class="style2">ListBox設定為<strong>「複選」！</strong> SelectionMode屬性 = 
        Multiple。<br />
        <br />
        (1). 先到對方那邊新增（.Add()方法）一個 Item。<br />
        (2). 最後，</span><strong><span class="style5">批次處理</span><span class="style2">「移除（.Remove()方法）」</span></strong><span class="style2">的事宜。</span><br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px" 
            SelectionMode="Multiple" ForeColor="#009900">
            <asp:ListItem>左一</asp:ListItem>
            <asp:ListItem>左二</asp:ListItem>
            <asp:ListItem>左三</asp:ListItem>
        </asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px" 
            SelectionMode="Multiple" ForeColor="Blue">
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
    </div>
    </form>
 
</body>
</html>

