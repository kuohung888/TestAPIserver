<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_FindControl_0_Error.aspx.cs" Inherits="Ch03_WebControls_11_FindControl_0_Error" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PlaceHolder控制項</title>
    <style type="text/css">
        .style1 {
            color: #FF0000;
            font-weight: bold;
            background-color: #99CCFF;
        }
        .style2
        {
            font-weight: bold;
            background-color: #FFFF66;
        }
        .style3
        {
            font-weight: bold;
            background-color: #99CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    PlaceHolder控制項<br />
    <span class="style3">(使用</span><span class="style2"><span class="style1">FindControl</span></span><span
        class="style3">抓取容器裡面的「子控制項」) </span>
    <br />
    <br />
    您知道這支程式錯在哪裡嗎？......
    <div>
        <br />
        *****************************************************<br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <br />
        *****************************************************<br />
        <br />
        <hr />
        <asp:Button ID="Button1" runat="server" Text="第一步，按下去，看看結果有何改變" OnClick="Button1_Click" />
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
