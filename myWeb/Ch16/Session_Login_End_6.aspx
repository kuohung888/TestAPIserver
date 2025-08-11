<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Login_End_6.aspx.cs" Inherits="Book_Sample_Ch16_Session_Login_End_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        改用/App_Code/Class2.cs類別檔，來取代 defense.inc檔案<br />


        <%
            //-- 第二種寫法。
            Class2 x = new Class2();
            x.defense2();
            
            //沒有在 Class2類別裡面設定 static。
            //   public void defense2()
            //   {
            //   }            
            //搭配 Class2.cs類別檔。
            
        Response.Write("<hr /><h2>......您好！這是改良後的程式（改用/App_Code/Class2.cs類別檔取代 Include file）......</h2>");
        %>
    </form>
</body>
</html>
