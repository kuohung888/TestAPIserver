<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03.aspx.cs" Inherits="Ch03_WebControls_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> «ö¶s -- CommandArgument  #1</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Button ID="Button1" runat="server" 
        CommandArgument="«¢Åo¡I±z­è­è«ö¤Uªº«ö¶s¬O[´ú¸Õ¡]test¡^]"
        Text="Button / ´ú¸Õ(test)" 
        onclick="Button1_Click" oncommand="Button1_Command" />
    </form>
 
</body>
</html>
