<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02_WebPage_AdoNet.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_ADOnet_01_WebPage" %>

<%@ Register Src="02_UC_AdoNet.ascx" TagPrefix="uc1" TagName="_UC_AdoNet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>政治</asp:ListItem>
            <asp:ListItem>教育</asp:ListItem>
            <asp:ListItem>娛樂</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:RadioButtonList>（AutoPostBack，還有後置程式碼）

        <br /><br />
        <br /><br />

        <uc1:_UC_AdoNet runat="server" ID="UC2" />
        <br />
        *** ADO.NET的程式寫在UC裡面。***
    </div>

    </form>
</body>
</html>
