<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1Book_Page_DropDownList.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_Book_Page" %>

<%@ Register Src="1Book_UC_DropDownList.ascx" TagPrefix="uc1" TagName="Book_UC1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        ==============================<br />
        ===   這是網頁內容(.aspx)   ===<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>CSPanel</asp:ListItem>
            <asp:ListItem>VBPanel</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        ==============================<br />



        <!-- 這個UC，可以控制兩個公開屬性。分別是：DisplayBook與 DisplayUrl -->
        <uc1:Book_UC1 runat="server" id="Book_UC" />

    </div>
    </form>
</body>
</html>
