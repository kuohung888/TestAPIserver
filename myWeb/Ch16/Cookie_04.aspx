<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cookie_04.aspx.cs" Inherits="Ch16_Cookie_04" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cookie_04</title>
</head>
<body>
    <body>
        <p>
            從名為 username的 Cookie取得值的兩種方式，並將其值顯示在 Label 控制項中
        </p>
        <p>
            <hr />
        </p>
        <form id="form1" runat="server">
        <p>
            <asp:Label ID="Label1" runat="server" Style="color: #FF0000"></asp:Label>
        </p>
        <p>
            &nbsp;
        </p>
        <p>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </p>
        <div>
        </div>
        </form>

    </body>
</html>

