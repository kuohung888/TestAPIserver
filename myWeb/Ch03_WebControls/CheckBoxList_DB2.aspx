<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckBoxList_DB2.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_CheckBoxList_DB2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF3399;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        搭配 CheckBoxList_Table資料表 #2<br />
        <a href="http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201208131731469E1.html">http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201208131731469E1.html</a><br />
        <br />
        資料表的第三個 TheFlag欄位，設定為<span class="auto-style1"><strong>y。該子選項則為 .Selected。</strong></span><br />
        <br />
        <br />
        資料表裡面，有兩個餐盒是「今日特餐」要當成清單控制項的「預設值」<br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
        </asp:CheckBoxList>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Style="font-weight: 700; color: #FF3399"></asp:Label>

    </div>
    </form>
</body>
</html>
