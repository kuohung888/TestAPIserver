<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListItem_CopyTo_Clear_AddRange.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_ListItem_CopyTo_Clear_AddRange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        介紹 ListItemCollection三種方法 --<strong> .CopyTo(<span class="style1">陣列</span>)方法、.Clear()方法、.AddRange(<span
            class="style1">陣列</span>)方法<br />
        </strong>
        <br />
        <a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.copyto.aspx#Y558">
            http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.copyto.aspx#Y558</a><br />
        <br />
        有兩個方法，都跟<strong><span class="style1">陣列</span></strong>有關（資料型態-- ListItem）<br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="150px" SelectionMode="Multiple"
            Width="100px">
            <asp:ListItem Value=".89">apples</asp:ListItem>
            <asp:ListItem Value=".49">bananas</asp:ListItem>
            <asp:ListItem Value="2.99">cherries</asp:ListItem>
            <asp:ListItem Value="1.49">grapes</asp:ListItem>
            <asp:ListItem Value="2.00">mangos</asp:ListItem>
            <asp:ListItem Value="1.09">oranges</asp:ListItem>
        </asp:ListBox>
        <asp:Button ID="Button1" runat="server" 
            Text="Button_子選項，全部刪除（.Clear()方法），並且搬移到下面 DropDownList" 
            onclick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF0066" Text="Label"></asp:Label>
        <br />
        <hr />
    </div>
    <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#FFCCFF">
    </asp:DropDownList>
    </form>
</body>
</html>
