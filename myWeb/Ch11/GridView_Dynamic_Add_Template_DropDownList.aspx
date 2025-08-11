<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_Dynamic_Add_Template_DropDownList.aspx.cs" Inherits="Ch11_GridView_Dynamic_Add_Template" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridView動態增加Template</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="text-align: left">
        GridView（固定五列）動態增加Template<hr>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            Font-Size="10.5pt" ForeColor="#333333" GridLines="None"
            Style="text-align: center">
            <Columns>
                <asp:BoundField HeaderText="id" DataField="u_id" />
                <asp:BoundField HeaderText="標題" DataField="u_text" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <br />

        &nbsp;增加幾列Template：
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="增加" Font-Size="10pt" />

    </div>
    </form>

</body>
</html>
