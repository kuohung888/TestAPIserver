<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_Enter_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Button_Enter_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            (1). 輸入文字以後，直接按下「Enter」做送出（Submit） ，會觸發哪一個按鈕？<br />
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="Button1" OnClick="Button1_Click" />
            <br />
            <br />

        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Button2" OnClick="Button2_Click" />
        <p>
            <asp:Button ID="Button3" runat="server" Text="Button3" OnClick="Button3_Click" />
        </p>
    </form>
</body>
</html>
