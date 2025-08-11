<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02_Error.aspx.cs" Inherits="Book_Sample_Ch02_2_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <%  Response.Write("我愛ASP.NET<br />");  %>

            <%  =("<hr />我愛ASP.NET<hr />") %>
            
            <% 
                =   "<br />我愛ASP.NET"    
            %>


            <!-- HTML註解：下面的寫法會出錯！！  -->
            <% 
                =   "<br />我愛ASP.NET"
                =   "<br />我愛ASP.NET"    
            %>
            <!-- HTML註解：最後不可以加上分號（;），否則會錯！！  -->
    </div>
    </form>
</body>
</html>
