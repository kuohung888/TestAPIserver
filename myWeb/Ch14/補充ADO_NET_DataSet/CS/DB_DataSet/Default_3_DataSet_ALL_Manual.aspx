<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_3_DataSet_ALL_Manual.aspx.cs" Inherits="Ch14_Default_3_DataSet_ALL_Manual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>未命名頁面</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            color: #CC0000;
        }
        .style3
        {
            color: #000000;
            font-weight: bold;
        }
        .style4
        {
            font-weight: bold;
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用ADO.NET 的 
        <span style="background-color: #ffff33" 
            class="style2">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫&nbsp; /&nbsp; 不依賴任何控制項 DataBind() / <b>傳統 HTML表格</b>來呈現資料<br />
        <br />
        <span class="style4">靜態字串相連（＆符號），速度較慢！</span><br />
        <br />
        用 for迴圈來處理 （<span class="style1">Try..Catche</span><span class="style3"> 區塊</span>）</div>
        <hr />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        
    </form>
</body>
</html>