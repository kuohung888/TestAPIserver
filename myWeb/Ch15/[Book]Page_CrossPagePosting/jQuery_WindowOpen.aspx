<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jQuery_WindowOpen.aspx.cs" Inherits="Book_Sample_jQuery_UI_jQuery_WindowOpen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>jQuery--開「新視窗」--Window.Open()</title>

       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js"></script>
        <script type="text/javascript">
            var windowSizeArray = ["width=200,height=200",
                                    "width=300,height=400,scrollbars=yes"];

            // 註解：第一個的尺寸200 x 200 ，無ScrollBar。
            //             第二個的尺寸300 x 400 ，出現ScrollBar。

            $(document).ready(function () {
                //Links that has the ".newWindow" class will call this script.
                $('.newWindow').click(function (event) {

                    // Gets the URL from the clicked link.
                    var url = $(this).attr("href");

                    /*Gets the name from the clicked link. Currently I commented out the
                      jquery script and just put "popUp" for a default name because I didn't
                      include the name in the links.*/
                    var windowName = "popUp";//$(this).attr("name");

                    /*Places the string from the array into the windowSize variable.
                      The array slot is determined by the "rel" number on the link.*/
                    var windowSize = windowSizeArray[$(this).attr("rel")];

                    //This method opens a new browser window.
                    window.open(url, windowName, windowSize);

                    /*Prevents the browser from executing the default action and
                      allows us to use the "window.open" within our script.*/
                    event.preventDefault();
                });
            });
        </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        jQuery--開「新視窗」--Window.Open()<br /><br />
       資料來源：http://www.codebelt.com/jquery/open-new-browser-window-with-jquery-custom-size/
        <hr />


        <br /><br />
        <a href="http://www.dotblogs.com.tw/mis2000lab/" rel="0" class="newWindow" >click me</a>
        <br /><br />
        <a href="http://www.yahoo.com.tw/" rel="1" class="newWindow" >click me</a>

    </div>
    </form>
</body>
</html>
