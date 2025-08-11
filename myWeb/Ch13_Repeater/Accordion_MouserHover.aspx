<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accordion_MouserHover.aspx.cs" Inherits="Book_Sample_jQuery_UI_Accordion_MouserHover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>手風琴折疊</title>
    <link rel="stylesheet" href="jQuery_JS_CSS/jquery-ui.css" />
    <script src="jQuery_JS_CSS/jquery-1.9.1.js"></script>
    <script src="jQuery_JS_CSS/jquery-ui.js"></script>
    <script>
        $(function() {
            $( "#accordion" ).accordion({
                event: "click hoverintent"
                //滑鼠經過「標題」，就會打開與關閉。
            });
        });

        /*
           * hoverIntent | Copyright 2011 Brian Cherne
           * http://cherne.net/brian/resources/jquery.hoverIntent.html
           * modified by the jQuery UI team
           */
        $.event.special.hoverintent = {
            setup: function() {
                $( this ).bind( "mouseover", jQuery.event.special.hoverintent.handler );
            },
            teardown: function() {
                $( this ).unbind( "mouseover", jQuery.event.special.hoverintent.handler );
            },
            handler: function( event ) {
                var currentX, currentY, timeout,
                  args = arguments,
                  target = $( event.target ),
                  previousX = event.pageX,
                  previousY = event.pageY;
 
                function track( event ) {
                    currentX = event.pageX;
                    currentY = event.pageY;
                };
 
                function clear() {
                    target
                      .unbind( "mousemove", track )
                      .unbind( "mouseout", clear );
                    clearTimeout( timeout );
                }
 
                function handler() {
                    var prop,
                      orig = event;
 
                    if ( ( Math.abs( previousX - currentX ) +
                        Math.abs( previousY - currentY ) ) < 7 ) {
                        clear();
 
                        event = $.Event( "hoverintent" );
                        for ( prop in orig ) {
                            if ( !( prop in event ) ) {
                                event[ prop ] = orig[ prop ];
                            }
                        }
                        // Prevent accessing the original event since the new event
                        // is fired asynchronously and the old event is no longer
                        // usable (#6028)
                        delete event.originalEvent;
 
                        target.trigger( event );
                    } else {
                        previousX = currentX;
                        previousY = currentY;
                        timeout = setTimeout( handler, 100 );
                    }
                }
 
                timeout = setTimeout( handler, 100 );
                target.bind({
                    mousemove: track,
                    mouseout: clear
                });
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            資料來源 <a href="http://jqueryui.com/accordion/#hoverintent">http://jqueryui.com/accordion/#hoverintent</a><br />
            <br />
            滑鼠經過「標題」，就會打開與關閉。不需按下滑鼠。<br />
            <br />

            <div id="accordion">
                <h3>Section 1</h3>
                <div>
                    <p>
                        === Section 1 ===<br />
                        === Section 1 ===<br />
                        === Section 1 ===<br />
                    </p>
                </div>
                <h3>Section 2</h3>
                <div>
                    <p>
                        === Section 2 ===<br />
                        === Section 2 ===<br />
                        === Section 2 ===<br />
                    </p>
                </div>
                <h3>Section 3</h3>
                <div>
                    <p>
                        === Section 3 ===<br />
                        === Section 3 ===<br />
                        === Section 3 ===<br />
                    </p>
                </div>
                <h3>Section 4</h3>
                <div>
                    <p>
                        === Section 4 ===<br />
                        === Section 4 ===<br />
                        === Section 4 ===<br />
                    </p>
                </div>
            </div>



        </div>
    </form>
</body>
</html>

