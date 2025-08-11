<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_DB_Image_03_1Insert.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_ASHX_FileUpload_DB_Image_03_1Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        FileUpload 檔案上傳，將圖片以「二進位」存入資料表<br />
        <br />
        <br />
        第二種作法，搭配 Fileupload_DB<span class="auto-style1"><strong>3</strong></span>&nbsp; 改用&nbsp; <strong><span class="auto-style2">varbinary(MAX)</span></strong>當作欄位的資料型態<br />
        資料來源：<a href="http://www.dotblogs.com.tw/shadow/archive/2011/06/12/28113.aspx">http://www.dotblogs.com.tw/shadow/archive/2011/06/12/28113.aspx</a>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_將圖片以「二進位」存入資料表" />
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label1" runat="server" style="color: #0066FF; font-weight: 700"></asp:Label>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        第一，上傳圖片後，存檔到硬碟。</p>
    <p>
        第二，使用<span class="auto-style1"><strong>SQL指令的OPENROWSET </strong></span>存入資料表 (Fileupload_DB<span class="auto-style1"><strong>3</strong></span>&nbsp;)</p>
</body>
</html>
