<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownLits_HTML5_optgroup.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_DropDownLits_HTML5_optgroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:DropDownList ID="ddlItems" runat="server"></asp:DropDownList>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        //資料來源：<a href="http://stackoverflow.com/questions/130020/dropdownlist-control-with-optgroups-for-asp-net-webforms">http://stackoverflow.com/questions/130020/dropdownlist-control-with-optgroups-for-asp-net-webforms</a>
        <br />
        <br />
        // 請在 <strong>/App_Code目錄</strong>裡面加入這個 <strong>DropDownListAdapter類別檔</strong>
        <br />
        <br />
        // 請把 本目錄底下的 <strong>/App_Borwser目錄</strong>放到網站的根目錄，<br />
&nbsp;&nbsp; 不然的話，會產生錯誤的HTML標籤</div>
    </form>
</body>
</html>
