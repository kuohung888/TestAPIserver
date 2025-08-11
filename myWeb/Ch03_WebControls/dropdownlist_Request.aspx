<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownlist_Request.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_dropdownlist_Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>利用 Request來抓取 DropDownList的[子選項]</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            利用 Request來抓取 DropDownList的 &quot;子選項&quot;<br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="111Value">111Text</asp:ListItem>
                <asp:ListItem Value="222Value">222Text</asp:ListItem>
                <asp:ListItem Value="333Value">333Text</asp:ListItem>
                <asp:ListItem Value="444Value">444Text</asp:ListItem>
                <asp:ListItem Value="555Value">555Text</asp:ListItem>
            </asp:DropDownList>
            (AutoPostBack = true)<br />

        </div>
    </form>
</body>
</html>
