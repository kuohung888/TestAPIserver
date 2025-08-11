<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListItem_02.aspx.cs" Inherits="_Book_New_Samples_ListItemCollection_ListItem_02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

    .style1
    {
        color: #FF0000;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        ListItemCollection類別 #2<br />
        <br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx#Y2760">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx#Y2760</a>
        <br />
        <br />
        <br />
        清單控制項都是「<strong>單選</strong>！」<br />
        每一個子選項都有<strong>「Text」與「Value」</strong>兩種屬性存在！<br />
        <br />
        挑選水果之後，右邊的GridView會出現水果的「<span class="style1"><strong>價格</strong></span>」<br />
        <table cellpadding="6" border="0">
            <tr>
                <td valign="top">
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" 
                        Height="150px" Width="100px">
                        <asp:ListItem Value=".89">apples</asp:ListItem>
                        <asp:ListItem Value=".49">bananas</asp:ListItem>
                        <asp:ListItem Value="2.99">cherries</asp:ListItem>
                        <asp:ListItem Value="1.49">grapes</asp:ListItem>
                        <asp:ListItem Value="2.00">mangos</asp:ListItem>
                        <asp:ListItem Value="1.09">oranges</asp:ListItem>
                    </asp:ListBox>
                </td>
                <td valign="top">
                    <asp:Button ID="addButton" runat="server" Text="Add -->" Width="100px" OnClick="addButton_Click">
                    </asp:Button>
                </td>
                <td valign="top">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
