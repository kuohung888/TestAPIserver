<%@ Page Language="C#" AutoEventWireup="true" CodeFile="V_3_DateTime.aspx.cs" Inherits="Book_Sample_Ch04_Validator_V_3_DateTime" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FF9900;
        }
        .style2
        {
            font-weight: bold;
            background-color: #FF66FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        CompareValidator也可以比對日期<br />
        <span class="style1">
        <br />
        Operator屬性 = DataTypeCheck</span>&nbsp;&nbsp;&nbsp; 檢查兩個控制項的資料型別是否有效。<br />
        <br />
        <span class="style2">Type屬性 = Date</span><br />
        <br />
        <br />
        日期一：<asp:TextBox ID="TextBox1" runat="server">2011/11/11</asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" 
            ErrorMessage="CompareValidator" Operator="DataTypeCheck" ForeColor="Red" 
            Type="Date">日期格式錯誤</asp:CompareValidator>
        <br />
        <br />
        日期二：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
