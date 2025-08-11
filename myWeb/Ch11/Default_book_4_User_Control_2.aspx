<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_User_Control_2.aspx.cs" Inherits="Ch11_Default_book_4_User_Control_2" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>使用者控制項（User Control） #2----改用「後置程式碼」來作</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <p>上一支程式的作法，是在HTML原始碼裡面，加入使用者控制項</p>
    <p>這支程式，將改用「後置程式碼」來作。</p>
    <p><span class="style2">關於「使用者控制項（User Control）」，微軟的官方文件寫的最仔細了，這幾篇文章很推薦大家觀賞：</span><a 
            href="http://msdn.microsoft.com/zh-tw/library/aa735701(VS.71).aspx" 
            target="_blank"><span class="style2">http://msdn.microsoft.com/zh-tw/library/aa735701(VS.71).aspx</span></a><span 
            style="FONT-SIZE: small">&nbsp;</span></p>
    <hr />
            因為在後置程式碼（Code Behind）裡面，動態加入使用者控制項，<br />

           所以不需要在HTML前端畫面，進行註冊。<br />
    <span class="style1">註解：在&lt;form&gt;裡面，”並沒有” 寫上使用者控制項的標籤！</span><br />
        
    <form id="form1" runat="server">
        <div>

        </div>
    </form>
    
 
</body>
</html>

