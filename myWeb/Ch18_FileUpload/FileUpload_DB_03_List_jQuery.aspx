<%@ Page Language="C#" debug="true" AutoEventWireup="true" CodeFile="FileUpload_DB_03_List_jQuery.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_FileUpload_DB_02_List" %>

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
            /*
			 *  Simple image gallery. Uses default settings
			 */

            $('.fancybox').fancybox();

            /*
			 *  Different effects
			 */

            // Change title type, overlay closing speed
            $(".fancybox-effects-a").fancybox({
                helpers: {
                    title: {
                        type: 'outside'
                    },
                    overlay: {
                        speedOut: 0
                    }
                }
            });

            // Disable opening and closing animations, change title type
            $(".fancybox-effects-b").fancybox({
                openEffect: 'none',
                closeEffect: 'none',

                helpers: {
                    title: {
                        type: 'over'
                    }
                }
            });

            // Set custom style, close if clicked, change title type and overlay color
            $(".fancybox-effects-c").fancybox({
                wrapCSS: 'fancybox-custom',
                closeClick: true,

                openEffect: 'none',

                helpers: {
                    title: {
                        type: 'inside'
                    },
                    overlay: {
                        css: {
                            'background': 'rgba(238,238,238,0.85)'
                        }
                    }
                }
            });

            // Remove padding, set opening and closing animations, close if clicked and disable overlay
            $(".fancybox-effects-d").fancybox({
                padding: 0,

                openEffect: 'elastic',
                openSpeed: 150,

                closeEffect: 'elastic',
                closeSpeed: 150,

                closeClick: true,

                helpers: {
                    overlay: null
                }
            });

            /*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

            $('.fancybox-buttons').fancybox({
                openEffect: 'none',
                closeEffect: 'none',

                prevEffect: 'none',
                nextEffect: 'none',

                closeBtn: false,

                helpers: {
                    title: {
                        type: 'inside'
                    },
                    buttons: {}
                },

                afterLoad: function () {
                    this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
                }
            });


            /*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

            $('.fancybox-thumbs').fancybox({
                prevEffect: 'none',
                nextEffect: 'none',

                closeBtn: false,
                arrows: false,
                nextClick: true,

                helpers: {
                    thumbs: {
                        width: 50,
                        height: 50
                    }
                }
            });

            /*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
            $('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
				    openEffect: 'none',
				    closeEffect: 'none',
				    prevEffect: 'none',
				    nextEffect: 'none',

				    arrows: false,
				    helpers: {
				        media: {},
				        buttons: {}
				    }
				});

            /*
			 *  Open manually
			 */

            $("#fancybox-manual-a").click(function () {
                $.fancybox.open('1_b.jpg');
            });

            $("#fancybox-manual-b").click(function () {
                $.fancybox.open({
                    href: 'iframe.html',
                    type: 'iframe',
                    padding: 5
                });
            });

            $("#fancybox-manual-c").click(function () {
                $.fancybox.open([
					{
					    href: '1_b.jpg',
					    title: 'My title'
					}, {
					    href: '2_b.jpg',
					    title: '2nd title'
					}, {
					    href: '3_b.jpg'
					}
                ], {
                    helpers: {
                        thumbs: {
                            width: 75,
                            height: 50
                        }
                    }
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
    
        <b>上傳的檔案路徑，會存在DB裡面</b>（<span class="auto-style1">FileUpload_DB資料表 / jQuery版 [fancyBox效果]</span>）<br />
        圖片上傳之後，列在畫面上。<br />
        <br />
        (1). ListView的「樣版」需<b>動手加入 Image控制項</b>，用來展示圖片。<br />
        (2). 您可能需要修改「樣版」裡面，Image控制項的<b>「路徑」</b>。目前設定為 <span class="style3">
        Uploads/        </span>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="FileUpload_DB_id" 
            DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                    FileUpload_DB_id:
                    <asp:Label ID="FileUpload_DB_idLabel" runat="server" 
                        Text='<%# Eval("FileUpload_DB_id") %>' />
                    <br />FileUpload_time:
                    <asp:Label ID="FileUpload_timeLabel" runat="server" 
                        Text='<%# Eval("FileUpload_time") %>' />
                    <br />上傳路徑與檔名：<br />
                    <asp:Label ID="test_idLabel" runat="server" Text='<%# "Uploads/" + Eval("FileUpload_FileName") %>' />
                    <br />
                    <br />



                    FileUpload_FileName + FileUpload_Memo:<br />
           <a class="fancybox" href='<%# "Uploads/" + Eval("FileUpload_FileName") %>' data-fancybox-group="gallery">
                    <asp:Image ID="Image1" runat="server"  Width="45px" Height="60px"
                                  ImageUrl='<%# "Uploads/" + Eval("FileUpload_FileName") %>'
                                  GenerateEmptyAlternateText="true" AlternateText='<%# Eval("FileUpload_Memo") %>' />
           </a>


                    <br />FileUpload_User:
                    <asp:Label ID="FileUpload_UserLabel" runat="server" 
                        Text='<%# Eval("FileUpload_User") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>

            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>

            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                    FileUpload_DB_id:
                    <asp:Label ID="FileUpload_DB_idLabel" runat="server" 
                        Text='<%# Eval("FileUpload_DB_id") %>' />
                    <br />FileUpload_time:
                    <asp:Label ID="FileUpload_timeLabel" runat="server" 
                        Text='<%# Eval("FileUpload_time") %>' />
                    <br />上傳路徑與檔名：<br />
                    <asp:Label ID="test_idLabel" runat="server" Text='<%# "Uploads/" + Eval("FileUpload_FileName") %>' />
                    <br />
                    <br />

                    FileUpload_FileName + FileUpload_Memo:<br />

        <a class="fancybox" href='<%# "Uploads/" + Eval("FileUpload_FileName") %>' data-fancybox-group="gallery">
                    <asp:Image ID="Image1" runat="server" Width="45px" Height="60px"
                         ImageUrl='<%# "Uploads/" + Eval("FileUpload_FileName") %>'
                        GenerateEmptyAlternateText="true" AlternateText='<%# Eval("FileUpload_Memo") %>' />
        </a>            


                    <br />FileUpload_User:
                    <asp:Label ID="FileUpload_UserLabel" runat="server" 
                        Text='<%# Eval("FileUpload_User") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT * FROM [FileUpload_DB]"></asp:SqlDataSource>
    
    </div>
    
    </form>
</body>
</html>
