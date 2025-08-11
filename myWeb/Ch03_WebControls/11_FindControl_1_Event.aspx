<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="11_FindControl_1_Event.aspx.cs" Inherits="Ch03_WebControls_11_FindControl_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <p>
        延續上一個範例（11_FindControl_0_Error.aspx），這次把動態加入 PlaceHolder的程式，</p>
    <p>
        寫在 Page_Load事件裡面。</p>
    <form id="form1" runat="server">
    <div>
        <hr />
        <br />
        *****************************************************<br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        *****************************************************<br />
        <br />
        <hr />
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="第二步，按下去，透過 FindControl抓取 PlaceHolder裡面的「子控制項（如：TextBox）」"
            OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
