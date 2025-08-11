<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="FileUpload_DB_05_Layer_jQuery.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_02_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <!-- Add jQuery library -->
    <script type="text/javascript" src="fancyBox/lib/jquery-1.8.2.min.js"></script>
    
    <!-- 資料來源：  http://www.51xuediannao.com/js/jquery/jquery_layer/layer.html -->
    <script src="layer-v1.8.3/layer/layer.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            //第一種作法：
            $('#test1').on('click', function () {
                layer.msg('Hello layer', 2, -1);   //2秒后自动关闭，-1代表不显示图标
            });

            //*********************************************************************************
            // API 說明書：  http://www.51xuediannao.com/js/jquery/jquery_layer/layer.html

            //第二種作法：弹出一个页面层
            $('#test2').on('click', function () {
                $.layer({
                    //各種屬性，請看 http://www.51xuediannao.com/js/jquery/jquery_layer/layer.html
                    type: 1,
                    title: false, //不显示默认标题栏  
                    shade: [0.5, '#000'], //顯示遮罩，黑色底
                    area: ['600px', '360px'],
                    page: { html: '<img src="http://static.oschina.net/uploads/space/2014/0516/012728_nAh8_1168184.jpg" alt="layer">' }
                // 页面层模式私有参数。 
                //    dom: 页面已存在的选择器 
                //    html: 直接传入的html字符串。 
                //    url: ajax请求地址。 
                //    ok: ajax请求完毕后执行的回调，datas是异步传递过来的值。 
                //    需要特别注意的是，dom、html、url只需设定其中一个就行，若配置html或url，你必须也配置宽高值。
                });
            });

            //第三種作法：
            $('#test3').on('click', function () {
            $.layer({
                type: 1,
                title: false, //不显示默认标题栏
                shade: [0], //不顯示遮罩
                area: ['420px', '260px'],
                page: {
                    html: '自定义内容'
                }, success: function () {
                    layer.shift('left'); //左边动画弹出
                }
            });
            });

        });
	</script>

</head>
<body>
    <form id="form1" runat="server">
        
        <div id="test1">請按我，11111111。會出現一個浮動圖層（兩秒後自動關閉）</div>
        <br />
        <br />

        <div id="test2">請按我，22222222。出現圖片</div>
        <br />
        <br />

        <div id="test3">請按我，33333333。左邊滑入一個小視窗</div>
        

    </form>
</body>
</html>
