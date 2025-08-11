<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Web_Calculator.aspx.cs" Inherits="Book_Sample_Ch16_Web_Calculator" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>小小計算機（Web版）</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        小小計算機（Web版），只有加法能運作 
        #1 &nbsp; (2012/5/7修改）<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Size="Large"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Font-Bold="True" Font-Size="Medium" Text="7"
            OnClick="Button7_Click" />
        &nbsp;<asp:Button ID="Button8" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="8" OnClick="Button8_Click" />
        &nbsp;<asp:Button ID="Button9" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="9" OnClick="Button9_Click" />
        &nbsp;
        <asp:Button ID="ButtonCE" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#009900"
            Text="CE 清除" Width="105px" OnClick="ButtonCE_Click" />
        <br />
        <asp:Button ID="Button4" runat="server" Font-Bold="True" Font-Size="Medium" Text="4"
            OnClick="Button4_Click" />
        &nbsp;<asp:Button ID="Button5" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="5" OnClick="Button5_Click" />
        &nbsp;<asp:Button ID="Button6" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="6" OnClick="Button6_Click" />
        &nbsp;
        <asp:Button ID="Button_x3" runat="server" Font-Bold="True" Font-Size="Medium" Text="X 乘"
            Width="50px" ForeColor="#999999" />
        <asp:Button ID="Button_x4" runat="server" Font-Bold="True" Font-Size="Medium" Text="/ 除"
            Width="50px" ForeColor="#999999" />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" Text="1"
            OnClick="Button1_Click" />
        &nbsp;<asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="2" OnClick="Button2_Click" />
        &nbsp;<asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Size="Medium"
            Text="3" OnClick="Button3_Click" />
        &nbsp;
        <asp:Button ID="Button_x1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
            Text="+ 加" Width="50px" OnClick="Button_x1_Click" />
        <asp:Button ID="Button_x2" runat="server" Font-Bold="True" Font-Size="Medium" Text="- 減"
            Width="50px" ForeColor="#999999" />
        <br />
        <asp:Button ID="Button0" runat="server" Font-Bold="True" Font-Size="Medium" Text="0"
            Width="80px" OnClick="Button0_Click" />
        &nbsp;
        <asp:Button ID="ButtonEnd" runat="server" Font-Bold="True" Font-Size="Large" Text="="
            Width="100px" ForeColor="#FF0066" OnClick="ButtonEnd_Click" />
        <br />
        <br />
        您剛剛輸入的：<asp:Label ID="Label1" runat="server" Style="color: #009900"></asp:Label>
    </div>
    </form>
</body>
</html>
