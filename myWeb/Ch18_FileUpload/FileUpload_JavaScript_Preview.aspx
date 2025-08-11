<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_JavaScript_Preview.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_JavaScript_Preview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>上傳圖片前，圖片預覽（JavaScript）</title>

<script type="text/javascript">
    function onLoadBinaryFile() {
        var theFile = document.getElementById("FileUpload1");

        // 確定選取了一個二進位檔案，而非其他格式。
        if (theFile.files.length != 0 && theFile.files[0].type.match(/image.*/)) 
        {
            var reader = new FileReader();
            reader.onload = function(e){
                var theImg = document.getElementById("Image1");
                theImg.src = e.target.result;
            };
            reader.onerror = function(e){
            alert("例外狀況，無法讀取二進位檔");
            };

            // 讀取二進位檔案。
            reader.readAsDataURL(theFile.files[0]);
        } 
        else {
            alert("請選取一個二進位檔"); 
        }
    }
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        本範例源自微軟認證教材-HTML5<br />
        改為搭配 ASP.NET控制項<br />
        <br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2013/08/20/ashx_beginner_02_fileupload_picture_preview.aspx">http://www.dotblogs.com.tw/mis2000lab/archive/2013/08/20/ashx_beginner_02_fileupload_picture_preview.aspx</a>
        <br />
        <br />
        只需把 JavaScript裡面的用到的「HTML表單元件ID」，改成「ASP.NET控制項ID」即可。<br />
        <br />
        <br />
        圖片上傳：<asp:FileUpload ID="FileUpload1" runat="server" onchange="onLoadBinaryFile()" />
        <br />
        <br />
        圖片預覽：<asp:Image ID="Image1" runat="server" />
    
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button_檔案上傳（程式沒寫）" />
    
    </div>
    </form>
</body>
</html>
