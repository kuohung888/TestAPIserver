<%@ Page Language="C#" AutoEventWireup="true" CodeFile="0_Page_Load_1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_MIS2000Lab_book_image_0_Page_Load_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #CC0000;
        }
        .auto-style1 {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        基本觀念！！ #1<br />
        <br />
        <br />
        不管您在畫面（Page）上，按下任何按鈕或是點選控制項，<br />
        <strong>重新載入頁面時，都會再一次觸發 Page_Load事件</strong>。<br />
        <br />
        <br />
        點擊次數：<asp:Label ID="Label1" runat="server" 
            style="font-weight: 700; color: #FF0000" Text="0"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_按下滑鼠，畫面的點擊次數就會累加" 
            onclick="Button1_Click" />
        <br />
        <span class="style1">累加的程式，寫在 <strong>Button1_Click事件<br />
        <br />
        <br />
        註解：完成這個範例後，<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 請您<span class="auto-style1">關閉</span> Label的<span class="auto-style1">「EnableViewState」屬性</span>，會發生什麼事情呢？</strong></span></div>
    </form>
</body>
</html>
