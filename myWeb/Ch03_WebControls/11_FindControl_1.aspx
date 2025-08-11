<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="11_FindControl_1.aspx.cs" Inherits="Ch03_WebControls_11_FindControl_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PlaceHolder</title>
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
        <asp:Button ID="Button2" runat="server" Text="第二步，按下去，透過 FindControl抓取 PlaceHolder裡面的「子控制項（如：TextBox）」"
            OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="color: #009900; font-weight: 700"></asp:Label>
        <br />
        <br />
        <br />
        <b>問題：</b>當您修改「動態產生的Text」身體裡面的值，再按下一次按鈕。<br />
        ......還能抓到您修改後的文字（值）嗎？<br />
        <br />
        以下採用 Request["控制項的UniqueID"]來抓取，請看結果：<br />
        <asp:Label ID="Label2" runat="server" Style="color: #CC0066; font-weight: 700"></asp:Label>
    </div>
    </form>
</body>
</html>
