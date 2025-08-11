<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegularExpression_07_SQL_Injection.aspx.cs" Inherits="Book_Sample_Ch04_Validator_RegularExpression_07_SQL_Injection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            color: #FF0000;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>Regular Expression範例 #7</strong><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/844skk0h.aspx">http://msdn.microsoft.com/zh-tw/library/844skk0h.aspx</a>
        <br />
        <br />
        <span id="xn1_607cfa815e30aa3cf8b6bb1f7dc97573" class="sentence">下列範例使用<strong>靜態</strong>
        <span xmlns="http://www.w3.org/1999/xhtml">
        <a href="http://msdn.microsoft.com/zh-tw/library/system.text.regularexpressions.regex.replace.aspx">
        <strong>Regex</strong><span xmlns=""><strong>.</strong></span><strong>Replace</strong></a></span><strong>()方法</strong>將字串中無效的字元刪除。但，<strong>符號「.&nbsp; 
        @&nbsp; !」三者例外！</strong><br />
        <br />
        <br />
        </span>
        <br />
        <br />
        原始字串：<strong>SQL Injection：123、@、-、.、--、'、1=1、!、我</strong><br />
        <br />
        <br />
        <span id="xn1_607cfa815e30aa3cf8b6bb1f7dc97574" class="sentence">規則運算式模式 <strong><span class="style2">[<span 
            class="style3">^</span>\w\.@!]</span></strong> 
        </span>
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FF0000"></asp:Label>
    
        <br />
        <br />
        <br />
        <span id="xn1_607cfa815e30aa3cf8b6bb1f7dc97575" class="sentence">規則運算式模式 <strong><span class="style2">[\w\.@!]</span></strong> 
        </span>
        <br />
        <asp:Label ID="Label2" runat="server" style="font-weight: 700; color: #009900"></asp:Label>
    
        <br />
        <br />
    
        <br />
        簡單解釋上面的規則：<br />
        <br />
        第一， ^符號，代表否定字元。 
        <br />
        [^character_group] 比對 “不”在 character_group 中的任何單一字元。<br />
        根據預設，character_group 中的字元 [會] 區分大小寫。 [^aei] 可以把字串&quot;reign&quot;中的 &quot;r&quot;、&quot;g&quot;、&quot;n&quot;留下來。 
        <br />
        <br />
        第二， \w （注意，是小寫w）比對任何文字字元。文字字元是指任何字母、十進位數字或標點符號連接，例如底線（_）。 
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \W 
        （注意，是大寫W）比對任何「非」文字字元。 
        <br />
        <br />
        第三，若可以接受的字元中包括這些特殊符號，則必須在特殊符號前加上 \符號。<br />
    
    </div>
    </form>
</body>
</html>
