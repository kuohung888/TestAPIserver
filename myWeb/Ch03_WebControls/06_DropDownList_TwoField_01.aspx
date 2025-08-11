<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06_DropDownList_TwoField_01.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_6_DropDownList_TwoField_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            background-color: #FFFF00;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        DropDownList裡面的 Text，一次呈現<span class="style2">兩個欄位</span>（Title與Author兩個欄位）<br />
        <span class="style1">方法一，透過 SQL指令處理。</span><br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </div>
    </form>
</body>
</html>
