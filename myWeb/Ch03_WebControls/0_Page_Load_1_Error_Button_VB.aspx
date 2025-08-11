<%@ Page Language="VB" AutoEventWireup="false" CodeFile="0_Page_Load_1_Error_Button_VB.aspx.vb" Inherits="Book_Sample_Ch03_Program__Book_WebControls_0_Page_Load_1_Error_Button_VB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            color: #FFFFFF;
            font-size: large;
            background-color: #990000;
        }
        .auto-style4 {
            color: #660066;
        }
        .auto-style5 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            基本觀念！！ #<strong>1.5</strong><br />
            &nbsp;<br />
            <strong><span class="auto-style3">錯誤版本 Only for VB</span><span class="auto-style2">，解釋VB與C#在Visual Studio操作的不同，「畫面上的控制項」與程式中的「事件」如何連結？</span></strong><br />
            <br />
            <br />
            不管您在畫面（Page）上，按下任何按鈕或是點選控制項，<br />
            <strong>重新載入頁面時，都會再一次觸發 Page_Load事件</strong>。<br />
            <br />
            <br />
            點擊次數：<asp:Label ID="Label1" runat="server"
                Style="font-weight: 700; color: #660066; font-size: large;" Text="0"></asp:Label>
            <br />
            <br />

            <!-- ****** 重點！！錯誤在此！！ 寫 VB程式，卻 COPY人家「C#的畫面」****** -->
            <asp:Button ID="Button1" runat="server" Text="Button_按下滑鼠，畫面的點擊次數就會累加"
                OnClick="Button1_Click" />
            <!-- ****** 重點！！錯誤在此！！****** -->


            <br />
            <span class="auto-style4">累加的程式，寫在 <strong>Button1_Click事件<br />
                <br />
                <br />
                <span class="auto-style5">錯誤！！為什麼按下按鈕，每次累加「二」？</span></strong></span>
            <br />
            <br />
            C# -- 在<strong>HTML原始碼（畫面）</strong>裡面，透過 <strong>OnClick = &quot;Button1_Click&quot;</strong>連結後置程式碼裡面的 Button1_Click事件。<br />
            <br />
            VB -- 在<strong>後置程式碼</strong>裡面，事件的 &quot;後面&quot;會有<strong>「Handles」關鍵字，寫上 Button1.Click</strong>
        </div>
    </form>
    <p>
        <strong><span class="auto-style3">錯誤版本 Only for VB </span></strong>上述兩者混用，便會造成此錯誤！
    </p>
</body>
</html>

