<%@ Page Language="C#" AutoEventWireup="true" CodeFile="03_1.aspx.cs" Inherits="Ch03_WebControls_3_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>«ö¶s -- CommandName #2</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Button ID="Button1" runat="server" 
        CommandArgument="«¢Åo¡I±z­è­è«ö¤Uªº«ö¶s¬O[´ú¸Õ¡]test¡^]" Text="Button / ´ú¸Õ(test)" 
        CommandName="ABC" onclick="Button1_Click" oncommand="Button1_Command" />
    </form>
 
</body>
</body>
</html>
