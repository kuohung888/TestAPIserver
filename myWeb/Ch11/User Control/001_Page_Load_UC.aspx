<%@ Page Language="C#" AutoEventWireup="true" CodeFile="001_Page_Load_UC.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_001_Page_Load_UC" %>

<%@ Register Src="001_Page_Load_UC.ascx" TagPrefix="uc1" TagName="uc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        又見面了！點選Button，讓畫面上的數字加一。<br />
        <br />
        點選 Page上的按鈕，只有Page上的數字會累加。<br />
        點選UC裡面的按鈕，只有UC裡面的數字會動。<span class="auto-style1">兩者不會互相干擾！</span>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="0"></asp:Label>
        <br />
        <span id="Span1" runat="server"></span>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button1_Page" OnClick="Button1_Click" />
        <br /><br /><br />


        ==== UC，使用者控制項 ==============================================<br />
        <uc1:uc runat="server" id="_Page_Load_UC" />

        <br /><br />
        ==== UC，使用者控制項 ==============================================<br />

    </div>
    </form>
</body>
</html>
