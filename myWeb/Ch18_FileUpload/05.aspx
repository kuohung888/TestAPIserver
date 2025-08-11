<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05.aspx.cs" Inherits="Ch18_FileUpload_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>檔案上傳 ＃5</title>
    <style type="text/css">
        .style1
        {
            background-color: #99CCFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <h4>檔案上傳 ＃5(Select a file to upload) :</h4>
   
            請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
       </asp:FileUpload>
            
       <br /><br />
       
       <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
       </asp:Button>    
       
       <hr />
       
       <asp:Label id="Label1" runat="server"></asp:Label>
            
    </form>
    <p><span class="style1">範例 5.aspx上載的檔案，其 &quot;副檔名&quot; 只允許為 .doc或 .xls。</span></p>
    <p><span class="style1">此控制項會呼叫 .Path.GetExtension()方法，以傳回要上載之檔案的 “副檔名”。</span></p>
 
</body>
</html>
