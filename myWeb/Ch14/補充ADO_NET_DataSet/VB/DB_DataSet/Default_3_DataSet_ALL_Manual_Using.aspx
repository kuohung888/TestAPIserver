<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_3_DataSet_ALL_Manual_Using.aspx.vb" Inherits="test_ADO_NET_Default_3_DataSet_ALL_Manual_Using" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
            text-decoration: underline;
        }
        .style2
        {
            font-weight: bold;
            background-color: #99FF66;
            color: #009900;
        }
        .style3
        {
            font-weight: bold;
            color: #009900;
            background-color: #99FF99;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        使用ADO.NET 的 <span class="style2">SqlDataAdapter /
            DataSet</span>。<br />
        Code Behind 完全手寫&nbsp; /&nbsp; 不依賴任何控制項 DataBind() / <b>傳統 HTML表格</b>來呈現資料<br />
        <br />
        <span class="style3">StringBuilder，速度快！</span><br />
        <br />
        用 for迴圈來處理&nbsp; <span class="style1">Using...版 + StringBuilder</span></div>
        <hr />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        
    </form>
</body>
</html>
