<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Dynamic_Add_Template_textbox.aspx.cs" Inherits="Ch11_GridView_Dynamic_Add_Template_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridView動態增加Template #1</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
            CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <Columns>
                <asp:BoundField HeaderText="u_id" DataField="u_id" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>

        <hr />
        &nbsp;增加幾列Template：<asp:TextBox ID="TextBox1" runat="server" Width="40px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="增加" OnClick="Button1_Click" />

        <br />

    </div>
    </form>

</body>
</html>
