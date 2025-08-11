<%@ Page Language="C#" AutoEventWireup="true" CodeFile="11_Dynamic_Generate_Controls_05_Nest.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_11_Dynamic_Generate_Controls_05_Nest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    
        動態產生控制項(5)<br />
        <br />
        先產生一個 Panel，裡面<span class="auto-style1"><strong>再加上</strong></span>TextBox<br />
        （<span class="auto-style1"><strong>巢狀的</strong></span>、動態加入控制項）<br />
        <br />
        執行後，檢查HTML原始碼，您會發現 Panel是以 &lt;div&gt;出現</div>
        <hr />



    </form>
</body>
</html>
