<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListItem_01.aspx.cs" Inherits="_Book_New_Samples_ListItemCollection_ListItem_01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ListItemCollection類別 #1<br />
        <br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx#Y2760">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.aspx#Y2760</a>
        <br />
        <br />
        <br />
        兩個清單控制項都是「<strong>單選</strong>！」<br />
        <table cellpadding="6" border="0">
            <tr>
                <td rowspan="2" valign="top">
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Single" Width="100px" Height="150px">
                    </asp:ListBox>
                </td>
                <td>
                    <asp:Button ID="moveButton1" runat="server" Text="Move -->" Width="100px" 
                        onclick="moveButton1_Click"></asp:Button>
                </td>
                <td rowspan="2" valign="top">
                    <asp:DropDownList runat="server" ID="DropDownList1" Width="100px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="moveButton2" runat="server" Text="<-- Move" Width="100px" 
                        onclick="moveButton2_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
