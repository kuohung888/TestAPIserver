<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_Preview_CodeBehind.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_JavaScript_Preview2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <p>
        <br />
        資料來源：<a href="http://www.dotblogs.com.tw/aquarius6913/archive/2013/04/26/102317.aspx">http://www.dotblogs.com.tw/aquarius6913/archive/2013/04/26/102317.aspx</a></p>
    <p>
        使用<span class="auto-style1"><strong>後置程式碼 + .ashx檔</strong></span>，作「上傳之前的圖片預覽」。</p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_上傳之前的「圖片預覽」" />
        </p>
    <div>
    
        <asp:Image ID="Image1" runat="server" />
        <br />
        <br />
        <br />VS 2013會出現錯誤，瀏覽檔案後上傳，會一直出現「未選檔案」。請用Chrome測試以發覺此狀況。<br />
    </div>
    </form>
</body>
</html>
