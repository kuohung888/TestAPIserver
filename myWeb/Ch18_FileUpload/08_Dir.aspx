<%@ Page Language="C#" AutoEventWireup="true" CodeFile="08_Dir.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_8_Dir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ASP.NET FileUpload #8</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h4>檔案上傳 ＃8 (Select a file to upload) :</h4>
        <p class="style1"><span class="style2">如果目錄不存在</span>， 程式會自動新建 <b>c:\temp\uploads\</b>這個目錄</p>
   
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
