<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UC_ViewState.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_UC_ViewState" %>

<%@ Register src="UC_ViewState.ascx" tagname="UC_ViewState" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        網頁 與 UC 兩者之間的 ViewState傳遞<br />
        <br />
        重點(1) -- 請寫在「網頁」的 Page_Init事件內<br />
        重點(2) -- 改用 Context.Items[]代替 ViewState[]</div>


        <uc1:UC_ViewState ID="UC_ViewState1" runat="server" />


        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        資料來源：<br />
        <a href="http://www.blueshop.com.tw/board/show.asp?subcde=BRD20140604224006R41&amp;fumcde=FUM20041006161839LRJ">http://www.blueshop.com.tw/board/show.asp?subcde=BRD20140604224006R41&amp;fumcde=FUM20041006161839LRJ</a>
        <br />
        <br />
        <a href="http://stackoverflow.com/questions/3020674/why-cant-i-access-page-viewstate-in-usercontrol">http://stackoverflow.com/questions/3020674/why-cant-i-access-page-viewstate-in-usercontrol</a>


    </form>
</body>
</html>
