<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11.aspx.cs" Inherits="Ch03_WebControls_11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PlaceHolder控制項</title>
</head>
<body>
    <form id="form1" runat="server">
    PlaceHolder控制項<br />
    <div>
        <br />
        *****************************************************<br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        *****************************************************<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="按下去，看看結果有何改變" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
