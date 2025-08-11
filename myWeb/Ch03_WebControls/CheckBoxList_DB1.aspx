<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckBoxList_DB1.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_CheckBoxList_DB1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        搭配 CheckBoxList_Table資料表 #1<br />
        <a href="http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201208131731469E1.html">http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201208131731469E1.html</a><br />
        <br />
        <br />
        <br />
        資料表裡面，有兩個餐盒是「今日特餐」要當成清單控制項的「預設值」<br />
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

