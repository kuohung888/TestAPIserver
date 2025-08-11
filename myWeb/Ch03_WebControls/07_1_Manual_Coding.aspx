<%@ Page Language="C#" AutoEventWireup="true" CodeFile="07_1_Manual_Coding.aspx.cs" Inherits="Ch03_WebControls_7_1_Manual_Coding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ch 3</title>
    <style type="text/css">

 p.MsoNormal	{
     	margin-bottom:.0001pt;
		font-size:12.0pt;
		font-family:"Times New Roman";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
 </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListBox ID="ListBox1" runat="server" DataTextField="title" DataValueField="id">
        </asp:ListBox>
        <br />
        <br />
        ListBox的HTML碼裡面，沒有搭配 SqlDataSource，因此缺了這一段「DataSourceID=&quot;SqlDataSource1&quot;」。&nbsp;
        <br />
        <br />
        不過，ListBox控制項本身也有一些設定，也就是 Text與Value這兩個屬性。
        <br />
        DataTextField=&quot;title&quot;&nbsp;&nbsp; DataValueField=&quot;id&quot;</div>
    </form>
</body>
</html>
