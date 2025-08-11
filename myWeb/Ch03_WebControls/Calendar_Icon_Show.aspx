<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar_Icon_Show.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Calendar_Icon_Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Calendar + ImageButton（障眼法）</title>
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="auto-style1">Calendar + ImageButton（障眼法）</span></strong><br />
        <br />
        1. TextBox ==&gt; 唯讀，ReadOnly屬性 = true<br />
        2. Calendar ==&gt; .Visible屬性 = false<br />
        3. 小圖示可以到這裡參考&nbsp; <a href="http://www.iconpng.com/tag/台历">http://www.iconpng.com/tag/%E5%8F%B0%E5%8E%86</a><br />
        <br />
        <br />

        請輸入日期：<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="Calendar_Icon.png" Height="79px" OnClick="ImageButton1_Click" Width="86px" />
        （這個<span class="auto-style2"><strong>ImageButton</strong></span>的 <strong>Click事件</strong>，控制下方Calendar的出現與否？）<br />
        <br />

        <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        （請事先設定Calendar的 .Visible = false，隱形）<br />
        <br />
        ===============================================<br />
        <br />
        姓名： <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        地址： 
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
