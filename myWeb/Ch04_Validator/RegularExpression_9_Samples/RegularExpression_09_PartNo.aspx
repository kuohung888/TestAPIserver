<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_09_PartNo.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_09_PartNo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #9</strong><br />資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/sdx2bds0.aspx">http://msdn.microsoft.com/zh-tw/library/sdx2bds0.aspx</a>
        <br />
        <br />在下列範例中，會示範如何使用 <strong>IsMatch(String, String) 方法</strong>判斷字串是否為有效的零件編號。<br />
        <br />規則運算式會假設零件編號具有特定格式，由連字號（-符號）分隔的三組字元組成。<br />
        <br />
        第一組，包含四個字元，內容必須為一個英數字元，後接兩個數值字元，再接著一個英數字元。<br />
        第二組，包含三個字元，必須為<strong>數值</strong>。<br />
        第三組，包含四個字元，內容必須為三個數值字元後接一個英數字元。<br />
        <br />
        <br />
        <strong><span class="style2">規則運算式模式&nbsp; ^[a-zA-Z0-9]\d{2}[a-zA-Z0-9](-\d{3}){2}[A-Za-z0-9]$</span></strong> 
        <br />
        <br />
        <hr />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
    
    </div>
    </form>
</body>
</html>
