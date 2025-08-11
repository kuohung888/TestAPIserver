<%@ Page Language="C#" AutoEventWireup="true" CodeFile="0_Page_Load_3.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_0_Page_Load_3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #009900;
        }
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #FFFFFF;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        基本觀念！！ 
        #3<br />
        <br />
        <br />
        不管您在畫面（Page）上，按下任何按鈕或是點選控制項，<br />
        重新載入頁面時，都會<strong>再一次觸發 Page_Load事件</strong>。<br />
        <br />
        <br />
        點擊次數：<asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; color: #009900" Text="0"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_按下滑鼠，畫面的點擊次數就會累加" />
    
        <br />
        <span class="style1">累加的程式，寫在<strong>Page_Load事件。<br />
        <br />
        改良的地方，加上 If Not Page.IsPostBack</strong></span></div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        ----------------------------------------------------------------------------------------------------------------------</p>
    <p>
        <span class="style2"><strong>Q : </strong></span>如果畫面上，<strong><span 
            class="style3">沒有</span></strong> <strong>Web控制項（如 Label）</strong>幫我們紀錄累加次數，<span 
            class="style2"><strong>只能透過 Response.Write()來呈現</strong></span>。</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 那該怎麼作？</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 這是非常重要的觀念，因為<strong>網頁程式</strong>在這裡的作法，跟一般程式不同！！</p>
    <p>
        <strong>A :</strong>
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/07/10/session_beginner_for_book_1_ch16.aspx">
        http://www.dotblogs.com.tw/mis2000lab/archive/2011/07/10/session_beginner_for_book_1_ch16.aspx</a>
    </p>
    <h3>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/07/10/session_beginner_for_book_1_ch16.aspx">
        [補充]上集, Ch.16 狀態管理 for Beginner （按鈕之後，數值加一，累加）</a></h3>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>

