<%@ Page Language="VB" EnableEventValidation="false"  AutoEventWireup="false" CodeFile="TextBox_Click_VB.aspx.vb" Inherits="Book_Sample_Ch03_WebControls_TextBox_Click_VB" %>

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

        <strong>按下 TextBox，能否觸發 Click事件？？<br />
        </strong>
        <br />
        資料來源： <a href="http://topic.csdn.net/u/20070808/23/a1fae97f-a0f9-43fd-bbb9-80f25c534cec.html">http://topic.csdn.net/u/20070808/23/a1fae97f-a0f9-43fd-bbb9-80f25c534cec.html</a>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://msdn.microsoft.com/zh-tw/library/ms153112">http://msdn.microsoft.com/zh-tw/library/ms153112</a>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <br />

    </div>
    <asp:Button ID="Button1" runat="server" Visible="false" Text="Button_隱藏，看不見 (.Visible=false)" />
    <br />
    <br />
    <br />
    <br />
    <strong>您必須在 .aspx檔最上方，<span class="auto-style1">@ Page指示詞</span>裡面，設定 <span class="auto-style1">EnableEventValidation=&quot;false&quot;</span>才行！</strong>
    </form>
</body>
</html>
