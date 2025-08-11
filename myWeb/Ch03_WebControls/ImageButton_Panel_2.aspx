<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageButton_Panel_2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ImageButton_Panel_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>


    
        放兩個控制項到 <strong>Panel身體裡面<br />
        </strong><br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Label--躲在Panel身體裡面"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Text="TextBox--躲在Panel身體裡面" Width="180px"></asp:TextBox>
            <br />
        </asp:Panel>
        <br />


    
    </div>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
