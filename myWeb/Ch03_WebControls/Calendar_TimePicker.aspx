<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendar_TimePicker.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_Calendar_TimePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="jquery_ui_timepicker_031/include/jquery-ui-1.8.14.custom.css" type="text/css" />
    <link rel="stylesheet" href="jquery_ui_timepicker_031/jquery.ui.timepicker.css?v=0.3.1" type="text/css" />

    <!-- uncomment to test with legacy jquery -->
    <!--
    <script type="text/javascript" src="jquery-1.2.6.js"></script>
    <script type="text/javascript" src="jquery.fix.for.1.2.6.js"></script>
    <script type="text/javascript" src="jquery.ui.1.6.all.js"></script>
-->

    <script type="text/javascript" src="jquery_ui_timepicker_031/include/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="jquery_ui_timepicker_031/include/jquery.ui.core.min.js"></script>
    <script type="text/javascript" src="jquery_ui_timepicker_031/include/jquery.ui.widget.min.js"></script>
    <script type="text/javascript" src="jquery_ui_timepicker_031/include/jquery.ui.tabs.min.js"></script>
    <script type="text/javascript" src="jquery_ui_timepicker_031/include/jquery.ui.position.min.js"></script>

    <script type="text/javascript" src="jquery_ui_timepicker_031/jquery.ui.timepicker.js?v=0.3.1"></script>

    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
    <style type="text/css">
        /* some styling for the page */
        body { font-size: 10px; /* for the widget natural size */ }
        #content { font-size: 1.2em; /* for the rest of the page to show at a normal size */
                   font-family: "Lucida Sans Unicode", "Lucida Grande", Verdana, Arial, Helvetica, sans-serif;
                   width: 950px; margin: auto;
        }
        .box { border: 1px solid #888; padding: 15px; margin:12px; }
        .code { margin: 6px; padding: 9px; background-color: #fdf5ce; border: 1px solid #c77405; }
        fieldset { padding: 0.5em 2em }
        hr { margin: 0.5em 0; clear: both }
        a { cursor: pointer; }
        #requirements li { line-height: 1.6em; }
    </style>

    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-24327002-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

        function plusone_clicked() {
            $('#thankyou').fadeIn(300);
        }

        $(document).ready(function () {
            $('#floating_timepicker').timepicker({
                onSelect: function (time, inst) {
                    $('#floating_selected_time').html('You selected ' + time);
                }
            });

            $('#tabs').tabs();

        });


    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        jQuery特效 -- <a href="http://fgelinas.com/code/timepicker/">http://fgelinas.com/code/timepicker/</a>
        <br />
        <br />
        TimerPicker（點選時間）
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#TextBox1').timepicker();
            });
        </script>



    </div>
    </form>
</body>
</html>
