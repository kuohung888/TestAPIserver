<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="FileUpload_DB_04_VariousType_jQuery.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_02_List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            background-color: #FFFF00;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>

    <!-- Add jQuery library -->
    <script type="text/javascript" src="fancyBox/lib/jquery-1.8.2.min.js"></script>

    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="fancyBox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="fancyBox/source/jquery.fancybox.js?v=2.1.3"></script>
    <link rel="stylesheet" type="text/css" href="fancyBox/source/jquery.fancybox.css?v=2.1.2" media="screen" />

    <!-- Add Button helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="fancyBox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <script type="text/javascript" src="fancyBox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

    <!-- Add Thumbnail helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="fancyBox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="fancyBox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

    <!-- Add Media helper (this is optional) -->
    <script type="text/javascript" src="fancyBox/source/helpers/jquery.fancybox-media.js?v=1.0.5"></script>


    <!------------------------------------------------------>
    <script type="text/javascript">
        $(document).ready(function () {
            // Simple image gallery. Uses default settings
            $('.fancybox').fancybox();

            /*
			 *  *********** 文字、超連結、多媒體專用 ********************
			 */

            $(document).ready(function () {
                $(".various").fancybox({
                    maxWidth: 800,
                    maxHeight: 600,
                    fitToView: false,
                    width: '70%',
                    height: '70%',
                    autoSize: false,
                    closeClick: false,
                    openEffect: 'none',
                    closeEffect: 'none'
                });
            });


        });
	</script>
    <!------------------------------------------------------>



    <style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
	    .auto-style1 {
            background-color: #FF99CC;
        }
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h3>使用fancyBox來展示文字、多媒體、影片、其他網頁......</h3>    
    
<ul class="list">
	<li>
		<a class="various fancybox.ajax" href="http://fancyapps.com/demo/ajax.php">使用Ajax，存取另一個PHP網頁</a>
	</li>
	<li>
		<a class="various" data-fancybox-type="iframe" href="http://fancyapps.com/demo/iframe.html">Iframe，呈現HTML</a>
	</li>
	<li>
		<a class="various" href="#inline">Inline -- 連結網頁另一個錨點（放在網頁下方、隱藏）</a>
	</li>
	<li>
		<a class="various" href="http://www.adobe.com/jp/events/cs3_web_edition_tour/swfs/perform.swf">SWF，展示另一個網頁的flash檔案</a>
	</li>
</ul>

<ul class="list">
	<li>
		<a class="various fancybox.iframe" href="http://www.youtube.com/embed/L9szn1QQfas?autoplay=1">Youtube (iframe)</a>
	</li>
	<li>
		<a class="various fancybox.iframe" href="http://maps.google.com/?output=embed&f=q&source=s_q&hl=en&geocode=&q=London+Eye,+County+Hall,+Westminster+Bridge+Road,+London,+United+Kingdom&hl=lv&ll=51.504155,-0.117749&spn=0.00571,0.016512&sll=56.879635,24.603189&sspn=10.280244,33.815918&vpsrc=6&hq=London+Eye&radius=15000&t=h&z=17">Google maps (iframe)</a>
	</li>
	<li>
		<a class="various" href="/data/non_existing_image.jpg">Non-existing url</a>
	</li>
</ul>

    </div>
    



        <!--  *****另一個錨點***** -->
        		<div id="inline" style="display:none;width:500px;">
			<h2>Lorem ipsum dolor sit amet</h2>

			<p>
				<a id="add_paragraph" title="Add" class="button button-blue" href="javascript:;">Add new paragraph</a>
				&nbsp;
				<a href="javascript:$.fancybox.close();">Close</a>
			</p>
			<p>
				Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			</p>
		</div>


    </form>
</body>
</html>
