<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBox_TextMode_Password_04_AJAX.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_TextBox_TextMode_Password_02_AJAX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ASP.NET AJAX(UpdatePanel)</title>
    <style type="text/css">
        .auto-style3 {
            color: #996633;
        }
        .auto-style4 {
            background-color: #FFFF99;
        }
        .auto-style5 {
            font-size: x-large;
        }
        .auto-style6 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            == 密碼再次確認&nbsp; ==</p>
        <p class="auto-style5">
            <strong>AJAX (UpdatePanel)版</strong></p>
        <p>
            &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%= System.DateTime.Now.ToLongTimeString() %>
        </p>
        <p>
            <span class="auto-style3">請輸入密碼：</span><asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3" TextMode="Password"></asp:TextBox>
            <span class="auto-style3">&nbsp;(TextMode=Password）
        </p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
            <ContentTemplate>
                <span class="auto-style4">********* UpdatePanel *********</span><p>
                    <span class="auto-style3">密碼再次確認：</span><asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" CssClass="auto-style3" OnTextChanged="TextBox2_TextChanged" TextMode="Password"></asp:TextBox>
                    <span class="auto-style3">(TextMode=Password，</span><span></span><span class="auto-style6"><strong>設定 AutoPostBack=true</strong></span><span class="auto-style3">） </span>
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **** 程式寫在 TextBox2_TextChanged事件裡面，訊息提示（Label）請寫在 UpdatePanel裡面。 
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large;"></asp:Label>
                    &nbsp;</p>
                <span class="auto-style4">*****************************</span>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="TextBox2" EventName="TextChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <p>
            &nbsp;
        </p>
        <p>
            請輸入姓名：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </p>
        <div>

            <br />
            <br />
            因為 AutoPostBack的緣故，密碼欄位會被清空，而無法留下。<br />
            <br />
            解決方法：<br />
            1.&nbsp; 不設定 AutoPostBack即可。<br />
            2.&nbsp; 改用「驗證控制項」
        </div>
    </form>

</body>
</html>
