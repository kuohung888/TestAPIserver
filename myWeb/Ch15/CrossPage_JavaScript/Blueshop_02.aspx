<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blueshop_02.aspx.cs" Inherits="Book_Sample_Ch15_CrossPage_JavaScript_Blueshop_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <!-- **************** -->
    <base target="_self" /> 


</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox222" runat="server"></asp:TextBox>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Button，將資料傳回上一頁（父網頁）" 
            OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
