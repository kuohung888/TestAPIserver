<%@ Page Language="C#" AutoEventWireup="true" CodeFile="04.aspx.cs" Inherits="Ch18_FileUpload_4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>檔案上傳 ＃4</title>
    <style type="text/css">
        .style1
        {
            background-color: #66FF99;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h4>檔案上傳 ＃4(Select a file to upload) :</h4>
   
            請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
       </asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
       </asp:Button>    
       <br />
        <span class="style1">本程式會介紹 FileContent。 </span>
       
       <hr />
       
       <asp:Label id="Label1" runat="server"></asp:Label>    
        <br /><br />

    FileContent :  <asp:TextBox ID="TextBox1" runat="server" Height="300px" TextMode="MultiLine" Width="400px"></asp:TextBox>
    <br /><br />
        <asp:Label id="Label2" runat="server"></asp:Label>    

    </div>
    </form>
 
</body>
</html>

