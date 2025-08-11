<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownList_03_Why.aspx.cs" Inherits="Book_Sample_Ch16_DropDownList_DropDownList_03_Why" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        <br />
        Why Error ????</p>
    <form id="form1" runat="server">
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="111Value">111Text</asp:ListItem>
                <asp:ListItem Value="222Value">222Text</asp:ListItem>
                <asp:ListItem Value="333Value">333Text</asp:ListItem>
                <asp:ListItem Value="444Value">444Text</asp:ListItem>
                <asp:ListItem Value="555Value">555Text</asp:ListItem>
            </asp:DropDownList>
        &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </p>
    <div>
    
    </div>
    </form>
</body>
</html>
