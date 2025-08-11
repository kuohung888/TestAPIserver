<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add_Multiple_3_function.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_3_function" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>手動新增一個選項 #2</title>
    <style type="text/css">
        .style2
        {
            color: #006600;
        }
        .style3
        {
            color: #FFFFFF;
        }
        .style4
        {
            background-color: #006600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        把兩個 ListBox裡面的子選項，左右搬動&nbsp; &nbsp;<span class="style3"><strong><span 
            class="style4">複選，成功（副程式）版</span></strong></span><br />
        <br />
        透過「陣列」紀錄 <strong>&quot;複選&quot;的時候，要被刪除的子選項</strong>。<br />
        <br />
        <span class="style2">ListBox設定為<strong>「複選」！</strong> SelectionMode屬性 = 
        Multiple。</span><br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px" 
            SelectionMode="Multiple" ForeColor="#009900" BackColor="#CCFF99">
            <asp:ListItem>左一</asp:ListItem>
            <asp:ListItem>左二</asp:ListItem>
            <asp:ListItem>左三</asp:ListItem>
        </asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px" 
            SelectionMode="Multiple" ForeColor="Blue" BackColor="#CCFFFF">
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
        <asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; background-color: #FFFF99"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        </div>
    </form>
 
</body>
</html>

