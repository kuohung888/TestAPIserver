<%@ Page Language="C#" AutoEventWireup="true" CodeFile="06.aspx.cs" Inherits="Ch18_FileUpload_6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>檔案上傳 ＃6</title>
</head>
<body>
   <form id="form1" runat="server">

       <h4>檔案上傳 ＃6(Select a file to upload) :</h4>
   
            請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
       </asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
       </asp:Button>    
       
       <hr />
       
       <asp:Label id="Label1" runat="server"></asp:Label>    
    </form>
    
 
</body>
</html>
