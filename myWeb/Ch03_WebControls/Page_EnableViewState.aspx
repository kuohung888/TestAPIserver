<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="false" CodeFile="Page_EnableViewState.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Page_EnableViewState" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <p>
        關閉<b>整個網頁</b>的 EnableViewState</p>
    <p>
        &lt;%@Page Language=&quot;C#&quot;&nbsp; <span class="style1">EnableViewState=&quot;false&quot;</span> 
        ...</p>
    <p>
        1 : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        2 : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
        3 : <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </form>
</body>
</html>
