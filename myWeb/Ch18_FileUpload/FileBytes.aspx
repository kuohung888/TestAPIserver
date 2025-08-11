<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileBytes.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileBytes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        FileUpload控制項的 <b>FileBytes屬性</b><br />
        資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filebytes.aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filebytes.aspx</a>
        <br />
        <br />
          <h4>Select a file to upload:</h4>

        <asp:FileUpload id="FileUpload1" runat="server">
        </asp:FileUpload>

        <br /><br />

        <asp:Button id="Button1" Text="上傳檔案" runat="server" onclick="Button1_Click">
        </asp:Button>

        <br /><br />

        <asp:Label id="UploadStatusLabel" runat="server" style="color: #996600">
        </asp:Label>  

        <hr />

        <asp:Label id="LengthLabel" runat="server">
        </asp:Label>  

        <br /><br />

        <asp:Label id="ContentsLabel" runat="server" style="color: #FF0000">
        </asp:Label>  

        <br /><br />

        <asp:PlaceHolder id="PlaceHolder1" runat="server">
        </asp:PlaceHolder>         
  
    </div>
    </form>
</body>
</html>
