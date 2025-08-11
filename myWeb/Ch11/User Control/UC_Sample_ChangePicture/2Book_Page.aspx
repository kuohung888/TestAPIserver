<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2Book_Page.aspx.cs" Inherits="Book_Page2" %>

<%@ Register Src="2Book_UC.ascx" TagPrefix="uc1" TagName="Book_UC2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>透過 enum與 ViewState , 跟UC傳遞資料 </title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        透過 enum與 ViewState , 跟UC傳遞資料 <br />
        ==============================<br />
        ==   這是網頁內容(.aspx) <span class="auto-style1"><strong>一開始的預設值，是VB圖片、超連結到mis2000lab網站</strong></span>   ==<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem>CS</asp:ListItem>
            <asp:ListItem>VB</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        ==============================<br />



        <!-- 這個UC，可以控制兩個公開屬性。分別是：DisplayBook與 DisplayUrl -->
        <uc1:Book_UC2 runat="server" id="Book_UC2"  />

        <br />這個UC，可以控制兩個公開屬性。分別是：DisplayBook與 DisplayUrl <br />
        <br />直接在HTML碼裡面，修改UC的屬性，可以運作。
        <br />如果不設定超連結（DisplayUrl屬性），就會使用預設值的網址URL。

    </div>
    </form>
</body>
</html>
