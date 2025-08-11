<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_Image_01_FileBytes.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_Image_01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #0000FF;
        }
        .auto-style2 {
            color: #006600;
        }
        .auto-style3 {
            color: #006600;
            background-color: #CCFF99;
        }
        .auto-style4 {
            background-color: #CCFF99;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        FileUpload 檔案上傳，將圖片以「二進位」存入資料表的 Image欄位格式<br />
        <br />
        (範例資料表 -- FileUpload_DB2 有兩個欄位，做了異動)<br />
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_將圖片以「二進位」存入資料表" />
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label1" runat="server" style="color: #006600; font-weight: 700"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        資料來源：<br />
        <br class="auto-style3" />
        <strong>
        <span class="auto-style2"><span class="auto-style4">改用FileUpload的 FileBytes來做</span><br class="auto-style4" />
        </span>
        <span class="auto-style1"><a href="http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filebytes(v=vs.110).aspx"><span class="auto-style3">http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.fileupload.filebytes(v=vs.110).aspx</span></a> </span>
        </strong>
    </form>
</body>
</html>
