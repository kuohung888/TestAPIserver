<%@ Page Language="C#" AutoEventWireup="true" CodeFile="String_Format.aspx.cs" Inherits="Ch03_WebControls_String_Format" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>String_Format</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="Button1" runat="server" Text="按下按鈕，將會呈現出字串格式"
            OnClick="Button1_Click" />

    </div>
    <br />
    數字(-123與 -123.45F)----<br />
    <asp:Label ID="Label1" runat="server" Style="color: #0000FF"></asp:Label>
    <hr />
    <p>
        日期----
    </p>
    <p>
        &nbsp;<asp:Label ID="Label2" runat="server" Style="color: #339933"></asp:Label>
    </p>
    </form>

</body>
</html>
