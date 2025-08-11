<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_2_DataSet_Relations.aspx.cs" Inherits="Book_Sample_Ch14_Default_2_DataSet_Relations" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            font-weight: bold;
            background-color: #99CCFF;
        }
        .style2
        {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #0000FF;
        }
        .style4
        {
            font-weight: bold;
            color: #000099;
            background-color: #99CCFF;
        }
        .style5
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #CC0000;
        }
        .style6
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        使用ADO.NET 的<b> </b><span style="color: #ff0000; " class="style3">DataSet -- </span>
        <span class="style4">Relations</span><br />
        <span class="style2">留言版</span><br />
        <br />
        Code Behind 完全手寫---- Try...Catch...Finally。<br />
        如果您想參考 <b>DataReader的版本</b>，請看範例 Default_1_3_DataReader_Manual_MARS.aspx<br />
        <br />
    
    </div>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <span class="style5">注&nbsp; 意！</span><br />
    如果兩個關連式資料表，裡面有資料對應不起來。<br />
    例如：「子Table」的記錄存在，但對應到「父Table」的記錄已經消失。<br />
    就會出現這樣的例外狀況：<span class="style6">無法啟用這個條件約束，因為不是所有值都有相對應的父值。</span></form>
</body>
</html>
