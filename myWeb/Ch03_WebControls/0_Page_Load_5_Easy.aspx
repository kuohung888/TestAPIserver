<%@ Page Language="C#" AutoEventWireup="true" CodeFile="0_Page_Load_5_Easy.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_0_Page_Load_0_Easy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 90%;
            border-style: solid;
            border-width: 1px;
            background-color: #CCFFCC;
        }
        .auto-style4 {
            width: 90%;
            border-style: solid;
            border-width: 1px;
            background-color: #00FFFF;
        }
        .auto-style5 {
            color: #006600;
            font-weight: bold;
        }
        .auto-style6 {
            width: 90%;
            border-style: solid;
            border-width: 1px;
            background-color: #FFCCFF;
        }
        .auto-style7 {
            color: #FF0000;
            font-weight: bold;
        }
        .auto-style8 {
            color: #FF0000;
        }
        .auto-style9 {
            color: #0000FF;
        }
        .auto-style10 {
            color: #0000FF;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />

        PostBack最簡單的說明。
         
        <br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2013/01/08/postback_q_and_a_20130108.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2013/01/08/postback_q_and_a_20130108.aspx</a>&nbsp;
        <br />
        <br />
        範例出處：<a href="http://imjyb1008.pixnet.net/blog/post/19247191">http://imjyb1008.pixnet.net/blog/post/19247191</a>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button1_請按我_紅茶" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button2_請按我_可樂" OnClick="Button2_Click" />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <hr />
        預設的情境：<br />
        <br />
        第一次執行程式，會觸發 Page_Load事件，出現下面的表格。<br />
        <br />
        <table align="center" class="auto-style3" border="1">
            <tr>
                <td class="auto-style5">產品名稱</td>
                <td class="auto-style5">產品代號</td>
            </tr>
            <tr>
                <td><b>快樂牌綠茶</b></td>
                <td><b>Happy Green Tea</b></td>
            </tr>
        </table>
        <br />
        然後，按下第一個按鈕，執行 Button<span class="auto-style9"><strong>1</strong></span>_Click程式，畫面會出現？？？<br />
    

    <table align="center" class="auto-style4" border="1">
        <tr>
            <td class="auto-style10">錫蘭紅茶</td>
            <td class="auto-style10">Black Tea</td>
        </tr>
    </table>
    <p>
        &nbsp;最後，按下第二個按鈕，執行 Button<span class="auto-style8"><strong>2</strong></span>_Click程式，畫面會出現？？？&nbsp;</p>
    <table align="center" class="auto-style6" border="1">
        <tr>
            <td class="auto-style7">美國可樂</td>
            <td class="auto-style7">Amercian Cola</td>
        </tr>
    </table>


    </div>
    </form>
</body>
</html>
