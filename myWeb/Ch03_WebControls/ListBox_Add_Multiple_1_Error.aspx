<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListBox_Add_Multiple_1_Error.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListBox_Add_Multiple_1_Error" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>手動新增一個選項 #1 -- 複選就會錯！！</title>
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
            color: #FFFFFF;
        }
        .style4
        {
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            把兩個 ListBox裡面的子選項，左右搬動&nbsp; &nbsp;<span class="style3"><strong><span
                class="style4">錯誤版</span></strong></span><br />
            <br />
            <span class="style2">ListBox設定為<strong>「複選」！</strong> SelectionMode屬性 = 
        Multiple發生錯誤。<strong><br />
            複選時，出錯。只會移動 
        Item，但無法移除。</strong></span><br />
            <br />
            //******************************************************
            <br />
            // C#不會出現錯誤。但結果仍然不對！！點選相鄰的兩個選項，只會移動一個過去。 
            <br />
            // VB 語法仍會報錯。 
            <br />
            //******************************************************<br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="125px" Width="85px"
                SelectionMode="Multiple" ForeColor="#009900" BackColor="#CCCCCC">
                <asp:ListItem>左一</asp:ListItem>
                <asp:ListItem>左二</asp:ListItem>
                <asp:ListItem>左三</asp:ListItem>
            </asp:ListBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="ListBox2" runat="server" Height="125px" Width="85px"
            SelectionMode="Multiple" ForeColor="Blue" BackColor="#CCCCCC">
            <asp:ListItem>右A</asp:ListItem>
            <asp:ListItem>右B</asp:ListItem>
            <asp:ListItem>右C</asp:ListItem>
        </asp:ListBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button1 右移==&gt;"
                OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="&lt;==Button2 左移"
            OnClick="Button2_Click" />
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
