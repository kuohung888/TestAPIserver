<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RadioButton.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_RadioButton" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    
        <span class="auto-style2"><strong>RadioButton</strong></span>，被選取是「Checked屬性」<br />
        <br />
    
    </div>

    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="1" />
    <br />

    <br />
    ===========================================<br />
    <br />
    <strong><span class="auto-style1">RadioButton<span class="auto-style3">List</span></span></strong>，被選取是「Selected屬性」。<br />
    <br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
    </asp:RadioButtonList>
    <br />
    </form>
</body>
</html>

