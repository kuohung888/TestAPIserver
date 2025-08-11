<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_3_DataSet_ALL_Manual_Using2.aspx.cs" Inherits="Book_Sample_Ch14_Default_3_DataSet_ALL_Manual_Using2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>雙重 Using...區塊</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            background-color: #CCFFFF;
        }
        .style3
        {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用ADO.NET 的 <span style="color: #0033cc; " class="style2">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫&nbsp; /&nbsp; 不依賴任何控制項 DataBind() / <b>傳統 HTML表格</b>來呈現資料<br />
        <br />
        <span style="color: #0033cc; " class="style2">StringBuilder 速度快！！<br />
        <br />
        </span>
        <br />
        用 for迴圈來處理 （<span class="style1"><span class="style3">雙重、甚至是三重</span> Using...區塊</span>）</div>
        <hr />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        
    </form>
</body>
</html>


