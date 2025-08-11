<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload_Preview_JavaScript.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_JavaScript_Preview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <!-- 資料來源：http://wangyong31893189.iteye.com/blog/1695472 -->
    <script type="text/javascript">
        function preview(file) {
            var prevDiv = document.getElementById('preview');
            if (file.files && file.files[0]) {
                var reader = new FileReader();
                reader.onload = function (evt) {
                    prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
                }
                reader.readAsDataURL(file.files[0]);
            }
            else {
                prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
            }
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        上傳之前，先用 JavaScript預覽圖片<br />
        <br />
        <span class="auto-style1"><strong>只有 Chrome / FireFox / IE 10（標準模式）有效</strong></span><br />
        <br />
        資料來源：<a href="http://wangyong31893189.iteye.com/blog/1695472">http://wangyong31893189.iteye.com/blog/1695472</a></div>
        <p>
            -------------------------------------------------------------------------------------------------</p>
        <p>
            &nbsp;</p>
        <asp:FileUpload ID="FileUpload1" runat="server" onchange="preview(this)" />
        <br />
        <br />
        <br />
        <!-- 重點！！ -->
        <div id="preview"></div>


    </form>
    <p>
        （FileUpload後置程式碼請自己補上，本範例沒用到）</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        相關文章：</p>
    <p>
        <a href="http://goodlucky.pixnet.net/blog/post/28571174-[asp-net]使用fileupload上傳前預覽圖片">http://goodlucky.pixnet.net/blog/post/28571174-%5Basp-net%5D%E4%BD%BF%E7%94%A8fileupload%E4%B8%8A%E5%82%B3%E5%89%8D%E9%A0%90%E8%A6%BD%E5%9C%96%E7%89%87</a></p>
    <p>
        <a href="http://franktsai.pixnet.net/blog/post/90029975-使用fileupload-上傳前先預覽圖片">http://franktsai.pixnet.net/blog/post/90029975-%E4%BD%BF%E7%94%A8fileupload-%E4%B8%8A%E5%82%B3%E5%89%8D%E5%85%88%E9%A0%90%E8%A6%BD%E5%9C%96%E7%89%87</a></p>
    <p>
        <a href="http://www.cnblogs.com/insus/archive/2012/11/13/2768951.html">http://www.cnblogs.com/insus/archive/2012/11/13/2768951.html</a> （阿源哥哥）</p>
</body>
</html>
