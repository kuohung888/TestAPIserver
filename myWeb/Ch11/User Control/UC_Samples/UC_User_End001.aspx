<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UC_User_End001.aspx.cs" Inherits="Book_Sample_Ch11_User_Control_UC_Samples_UC_User_End" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>依照不同登入等級，出現不同的UC畫面</title>
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            background-color: #FF0000;
        }
        .style3
        {
            color: #FFFFFF;
            background-color: #FF0000;
        }
    </style>
</head>
<body>
        <!--#INCLUDE FILE="defense.aspx"-->

        <b><span class="style3">後端管理區 -- 請從 UC_User_Login.aspx 登入此網頁</span><span class="style2"><br class="style1" />
        </span></b>
        <br />
        <br />
        <br />

        <!-- 依照不同登入等級，出現不同的UC畫面。 -->

    <form id="form1" runat="server">
    <div>
        

    </div>
    </form>
</body>
</html>
