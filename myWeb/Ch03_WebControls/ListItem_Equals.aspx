<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListItem_Equals.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListItem_Equals" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ListItemCollection類別 （<strong>.Equals()方法</strong>）<br />
        <br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.contains.aspx">
            http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.contains.aspx</a>
        <br />
        <br />
        <br />
        <br />
        <table border="0" cellpadding="6">
            <tr>
                <td valign="top" width="100px">
                    請您挑選後，將子選項移動到右側ListBox
                    <br />
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value=".89">apples</asp:ListItem>
                        <asp:ListItem Value=".49">bananas</asp:ListItem>
                        <asp:ListItem Value="2.99">cherries</asp:ListItem>
                        <asp:ListItem Value="1.49">grapes</asp:ListItem>
                        <asp:ListItem Value="2.00">mangos</asp:ListItem>
                        <asp:ListItem Value="1.09">oranges</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td valign="middle">
                    <asp:Button ID="addButton" runat="server" Text="Add --&gt; 如果子選項「重複」就會出現警告！" 
                        Width="293px" onclick="addButton_Click" />
                </td>
                <td valign="top" width="150px">
                    <asp:ListBox ID="ListBox1" runat="server" Height="150px" SelectionMode="Multiple"
                        Width="100px">
                        <asp:ListItem Value=".89">apples</asp:ListItem>
                        <asp:ListItem Value=".49">bananas</asp:ListItem>
                        <asp:ListItem Value="2.99">cherries</asp:ListItem>
                        <asp:ListItem Value="1.49">grapes</asp:ListItem>
                        <asp:ListItem Value="2.00">mangos</asp:ListItem>
                        <asp:ListItem Value="1.09">oranges</asp:ListItem>
                    </asp:ListBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
