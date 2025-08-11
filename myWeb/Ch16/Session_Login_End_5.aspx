<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Session_Login_End_5.aspx.cs" Inherits="Book_Sample_Ch16_Session_Login_End_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        改用/App_Code/Class1.cs類別檔，來取代 defense.inc檔案<br />


        <%
            //-- 第一種寫法。
            Class1.defense();     
            
            //如果您在 Class1類別裡面設定 static，便能這樣直接呼叫。
            //   public static void defense()
            //   {
            //   }     
            //不然的話，請用下一個範例（Session_Login_End_6.aspx）的寫法。搭配 Class2.cs類別檔。
            
        Response.Write("<hr /><h2>......您好！這是改良後的程式（改用/App_Code/Class1.cs類別檔取代 Include file）......</h2>");
        %>
    </form>
</body>
</html>
