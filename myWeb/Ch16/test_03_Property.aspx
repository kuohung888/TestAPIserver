<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test_03_Property.aspx.cs" Inherits="Book_Sample_Ch16_test_03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用 Session或是 ViewState來作 #2。<span class="auto-style1"><strong>改良版，利用公開屬性 (Property)。 </strong></span>
        <br />
        <br />
        <br />（畫面上沒有Label）
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_按下去，數字就會累加"
            OnClick="Button1_Click" />

    </div>
    </form>
</body>
</html>
