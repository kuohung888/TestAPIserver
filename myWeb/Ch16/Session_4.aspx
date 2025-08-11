<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_4.aspx.cs" Inherits="Ch16_Session_4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>檢查使用者身份</title>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    檢查使用者身份<hr />
    <p>
        Session的範例&nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <span class="style1">Thanks....您已經輸入過個人資料了<br />
            <br />
        </span>
        <br />
        姓名：<asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
        <br />
        公司：<asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </asp:Panel>
    <div>

        <br />
        <br />

        <br />

    </div>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        請輸入您的個人資料<br />
        <br />
        姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        公司：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button/檢查使用者身份，是否已經登入過？"
            OnClick="Button1_Click" />
    </asp:Panel>
    </form>

</body>
</html>
