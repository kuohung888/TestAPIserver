<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AJAX_Case_2.aspx.cs" Inherits="Ch16_AJAX_Case_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>聊 天 室（AJAX版）----  主畫面</title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        &lt;&lt;聊 天 室&nbsp; <span class="style1">AJAX</span>&gt;&gt;<hr />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <asp:Label ID="Label_timer" runat="server"
                    Style="color: #FFFF66; background-color: #0000FF"></asp:Label>
                &nbsp;/ 
            每0.5秒透過AJAX更新一次畫面<hr />

                <asp:Label ID="Label1" runat="server"></asp:Label>
                <asp:Timer ID="Timer1" runat="server" Interval="500" OnTick="Timer1_Tick">
                </asp:Timer>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
        <hr />

        請輸入聊天內容：<asp:TextBox ID="TextBox1" runat="server" Width="348px"></asp:TextBox>
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Submit/送出" OnClick="Button1_Click" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="TextBox1" ErrorMessage="不可以留空白！" Style="text-align: center"></asp:RequiredFieldValidator>
        <br />
        <br />
        <div align="center">
            <asp:Button ID="Button2" runat="server" Text="不玩了，掰掰～～Exit" OnClick="Button2_Click" Style="text-align: right" />
        </div>
    </p>
    </form>

</body>
</html>
