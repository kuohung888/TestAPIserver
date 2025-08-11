<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckBox.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_CheckBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #0000FF;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="auto-style2"><strong>CheckBox</strong></span>，被選取是「Checked屬性」<br />
        <br />
    
    </div>
    <asp:CheckBox ID="CheckBox1" runat="server" />
    <br />
    <br />
    ===========================================<br />
    <br />
    <strong><span class="auto-style1">CheckBox<span class="auto-style3">List</span></span></strong>，被選取是「Selected屬性」。<br />
    <br />
    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
    </asp:CheckBoxList>
    </form>
</body>
</html>
