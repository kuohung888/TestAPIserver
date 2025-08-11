<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2_Repeated_Values_DataBinding_DataTable.aspx.cs" Inherits="Book_Sample_B06_DataBinding_Repeated_Values_DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h3>Repeated-Values DataBinding--DataTable版（成功）</h3>

        請先設定好「清單控制項」的「Text」與「Value」。
        <hr />

        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:CheckBoxList>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:DropDownList>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataTextField="title" DataValueField="id">
        </asp:RadioButtonList>

    </div>
    </form>
</body>
</html>
