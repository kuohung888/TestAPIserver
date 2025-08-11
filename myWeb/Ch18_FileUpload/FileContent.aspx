<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileContent.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>FileUpload.FileContent 屬性</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b>FileUpload.FileContent 屬性  
        <br />
        <br />
        </b>本範例的資料來源：<a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filecontent.aspx">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filecontent.aspx</a>
    
        <br />
        <br />
        FileContent 屬性用於將檔案的內容讀取至<span class="style1">位元組陣列</span>。<br />
        <br />
        當使用者按一下 [檔案上傳] 按鈕時，上載檔案的內容會在頁面上的文字方塊(TextBox)中顯示為<span 
            class="style1">位元組</span>。</div>

        <hr />
                <br />
    請先選取檔案，然後再上傳：<asp:FileUpload id="FileUpload1" runat="server">
        </asp:FileUpload>

        <br /><br />

        <asp:Button id="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click">
        </asp:Button>

        <br /><br />

        <asp:Label id="UploadStatusLabel" runat="server">
        </asp:Label>  

        <hr />

        <asp:Label id="LengthLabel" runat="server">
        </asp:Label>  

        <br /><br />

        <asp:Label id="ContentsLabel" runat="server">
        </asp:Label>  

        <br />

        <br /><br />

        <asp:PlaceHolder id="PlaceHolder1" runat="server">
        </asp:PlaceHolder>  
    </form>
</body>
</html>
