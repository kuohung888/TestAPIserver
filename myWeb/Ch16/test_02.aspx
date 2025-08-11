<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_02.aspx.cs" Inherits="Book_Sample_Ch16_test_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用 Session或是 ViewState來作。
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="color: #CC0000" Text="0"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_按下去，數字就會累加"
            OnClick="Button1_Click" />

    </div>
    </form>
</body>
</html>
