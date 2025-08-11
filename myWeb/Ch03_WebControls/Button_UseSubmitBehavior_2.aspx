<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Button_UseSubmitBehavior_2.aspx.cs" Inherits="Ch03_WebControls_Button_UseSubmitBehavior_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>底下的送出按鈕，只能使用一次！ #2</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        底下的送出按鈕，只能使用一次！ #2<br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit / 送出" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
