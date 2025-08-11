<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_Table_04_CSS.aspx.cs" Inherits="Book_Sample_Ch12_ListView_HTML_Table_HTML_Table_04_CSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        /* 	Blue Dream
	        Written by Teylor Feliz  http://www.admixweb.com */


        table { background:#D3E4E5;
         border:1px solid gray;
         border-collapse:collapse;
         color:#fff;
         font:normal 12px verdana, arial, helvetica, sans-serif;
        }
        caption { border:1px solid #5C443A;
         color:#5C443A;
         font-weight:bold;
         letter-spacing:20px;
         padding:6px 4px 8px 0px;
         text-align:center;
         text-transform:uppercase;
        }
        td, th { color:#363636;
         padding:.4em;
        }
        tr { border:1px dotted gray;
        }
        thead th, tfoot th { background:#5C443A;
         color:#FFFFFF;
         padding:3px 10px 3px 10px;
         text-align:left;
         text-transform:uppercase;
        }
        tbody td a { color:#363636;
         text-decoration:none;
        }
        tbody td a:visited { color:gray;
         text-decoration:line-through;
        }
        tbody td a:hover { text-decoration:underline;
        }
        tbody th a { color:#363636;
         font-weight:normal;
         text-decoration:none;
        }
        tbody th a:hover { color:#363636;
        }
        tbody td+td+td+td a { background-image:url('http://www.admixweb.com/downloads/csstablegallery/bullet_blue.png');
         background-position:left center;
         background-repeat:no-repeat;
         color:#03476F;
         padding-left:15px;
        }
        tbody td+td+td+td a:visited { background-image:url('http://www.admixweb.com/downloads/csstablegallery/bullet_white.png');
         background-position:left center;
         background-repeat:no-repeat;
        }
        tbody th, tbody td { text-align:left;
         vertical-align:top;
        }
        tfoot td { background:#5C443A;
         color:#FFFFFF;
         padding-top:3px;
        }
        .odd { background:#fff;
        }
        tbody tr:hover { background:#99BCBF;
         border:1px solid #03476F;
         color:#000000;
        }

    thead{
	background: #FFA109;
    }
    table *{
	    font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	    font-size: small;
    }
    *{margin:0;padding:0;list-style:none;}
    tfoot{
	    background: #FFA109;
    }

    #textcontent h2,#textcontent h3{
      font-family:calibri,helvetica,arial,sans-serif;
      font-size:120%;
      margin:1em 0;
    }
    h2{
      font-size:120%;
      font-family:calibri,helvetica,arial,sans-serif;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    





        <br />
        <br />
        <p>
            這裡有很多套的 CSS + Table的樣式，您可以自行參考</p>
        <p>
            <a href="http://icant.co.uk/csstablegallery/tables/13.php">http://icant.co.uk/csstablegallery/tables/13.php</a>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <div id="itsthetable">
            <table summary="Submitted table designs">
                <caption>
                    Table designs</caption>
                <thead>
                    <tr>
                        <th scope="col">Design Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Country</th>
                        <th scope="col">Comment</th>
                        <th scope="col">Download</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th scope="row">Total</th>
                        <td colspan="4">67 designs</td>
                    </tr>
                </tfoot>
                <tr>
                    <th id="r100" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/100.php">rows table template</a></th>
                    <td><a href="http://www.adobati.it/">Omar &#39;0m4r&#39; Adobati</a></td>
                    <td>Italy</td>
                    <td>Simple, clean and a quite classic table template :)</td>
                    <td><a href="http://www.adobati.it/labs/CSSTable/0m4r.table.css" title="Download the rows table template CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r99" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/99.php">Blue Dream</a></th>
                    <td><a href="http://www.admixweb.com/">Teylor Feliz</a></td>
                    <td>USA</td>
                    <td>Beautiful combination of Blue and Brown.</td>
                    <td><a href="http://www.admixweb.com/downloads/csstablegallery/bluedream.css" title="Download the Blue Dream CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r98" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/98.php">Web20 Table</a></th>
                    <td><a href="http://www.netway-media.com/">Netway Media Webdesign</a></td>
                    <td>Germany</td>
                    <td>Nice, very simple and clean style with a gradient.</td>
                    <td><a href="http://www.netway-media.com/freedesigns/table/web20.css" title="Download the Web20 Table CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r97" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/97.php">TagBox</a></th>
                    <td><a href="http://www.tagbox.de/">TagBox</a></td>
                    <td>Deutschland</td>
                    <td>Table design based on the fresh TagBox style.</td>
                    <td><a href="http://www.tagbox.de/style/tagbox.css" title="Download the TagBox CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r96" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/96.php">Maniac Merchants</a></th>
                    <td><a href="http://www.marvmerchants.com/">Marten Willberg</a></td>
                    <td>Germany</td>
                    <td>A Georgia headline with a green-blue body.</td>
                    <td><a href="http://www.marvmerchants.com/merchants.css" title="Download the Maniac Merchants CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r95" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/95.php">Acuity Design Style</a></th>
                    <td><a href="http://www.acuity.com.br/">Acuity Internet Marketing</a></td>
                    <td>Brazil</td>
                    <td>Black Style, with smooth grey and green elements.</td>
                    <td><a href="http://www.acuity.com.br/extern/icant.co.uk/acuity.css" title="Download the Acuity Design Style CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r93" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/93.php">Smooth Taste</a></th>
                    <td><a href="http://www.yaway.de/">Thomas Opp</a></td>
                    <td>Germany</td>
                    <td>Smooth style with my favourite colours. Enjoy!</td>
                    <td><a href="http://www.templatestyler.de/styles/css/smoothtaste.css" title="Download the Smooth Taste CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r91" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/91.php">Sky is no heaven</a></th>
                    <td><a href="http://www.slifer.de/">Michael Schmieding</a></td>
                    <td>Germany</td>
                    <td>My new Design colors.</td>
                    <td><a href="http://www.slifer.de/sky.css" title="Download the Sky is no heaven CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r90" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/90.php">Foggy Country</a></th>
                    <td><a href="http://www.straussennest.net/">Straussennest</a></td>
                    <td>South Africa</td>
                    <td>Foggy Country - Green Trees planted on brown sugared ground.</td>
                    <td><a href="http://www.straussennest.net/foggycountry.css" title="Download the Foggy Country CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r89" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/89.php">Blue gradient</a></th>
                    <td><a href="http://www.roscripts.com/">Mihalcea Romeo</a></td>
                    <td>Romania</td>
                    <td>Nice table design based on a very subtile blue gradient.</td>
                    <td><a href="http://www.roscripts.com/css/table_design.css" title="Download the Blue gradient CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r88" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/88.php">desert</a></th>
                    <td><a href="http://www.bodon.de/">Marc Bodon</a></td>
                    <td>Germany</td>
                    <td>brown, red, grey and white... simply smooth ;-)</td>
                    <td><a href="http://www.bodon.de/data/stylesheet_table.css" title="Download the desert CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r87" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/87.php">orange and grey</a></th>
                    <td><a href="http://www.visual4.de/">Christoph Plessner</a></td>
                    <td>Germany</td>
                    <td></td>
                    <td><a href="http://www.ad-plus.de/table/visual4tab.css" title="Download the orange and grey CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r85" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/85.php">REDandBLACK</a></th>
                    <td><a href="http://www.consulting1x1.com/">Martin Paffenholz</a></td>
                    <td>Germany</td>
                    <td>Style like our website. Best viewed in Mozilla Firefox.</td>
                    <td><a href="http://www.consulting1x1.com/csstg/redandblack.css" title="Download the REDandBLACK CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r82" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/82.php">The OC</a></th>
                    <td><a href="http://www.fitodotnet.com/">Rodolfo Marin</a></td>
                    <td>Chile</td>
                    <td>Table based in the color table from one of my latest design, overclockers.cl</td>
                    <td><a href="http://www.fitodotnet.com/csstablegallery/tablita.css" title="Download the The OC CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r81" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/81.php">blue like ice</a></th>
                    <td><a href="http://hjemmesideskolen.dk/">Erik Ginnerskov</a></td>
                    <td>Denmark</td>
                    <td>Nice and clean. No fancy stuff.</td>
                    <td><a href="http://hjemmesideskolen.dk/csstablegallery/iceblue.css" title="Download the blue like ice CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r80" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/80.php">Dark Night</a></th>
                    <td><a href="http://www.slifer.de/">Michael Schmieding</a></td>
                    <td>germany</td>
                    <td>That&#39;s my design with my favorite colors. I hope you like it.</td>
                    <td><a href="http://www.slifer.de/dark-night.css" title="Download the Dark Night CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r79" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/79.php">mediagroove</a></th>
                    <td><a href="http://mgmg.tv/">mayumi takami</a></td>
                    <td>Japan</td>
                    <td>i like this type of design.</td>
                    <td><a href="http://www.nonamedesign.info/table_gallery/mediagroove.css" title="Download the mediagroove CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r78" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/78.php">chives&#39; tables</a></th>
                    <td><a href="http://www.chives.de/">chives</a></td>
                    <td>Germany</td>
                    <td>Clean and spicy design from chives-team</td>
                    <td><a href="http://www.chives.de/style/chives-tables.css" title="Download the chives' tables CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r77" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/77.php">table red-white</a></th>
                    <td><a href="http://www.4wdmedia.de/">Jens</a></td>
                    <td>Germany</td>
                    <td>Inspired by the original &#39;Assischale&#39; and dedicated to &#39;Kollesche&#39; ;-) Best wishes to everybody!</td>
                    <td><a href="http://www.4wdmedia.de/stuff/table_red_white.css" title="Download the table red-white CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r76" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/76.php">Candy</a></th>
                    <td><a href="http://www.sbihl.de/">Stefan Bihl</a></td>
                    <td>Germany</td>
                    <td>Hi, I hope this CSS File is not to pink ;-) Regards Stefan</td>
                    <td><a href="http://www.webdesign-sh.de/csstable/table.css" title="Download the Candy CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r74" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/74.php">Blue</a></th>
                    <td><a href="http://www.nghorta.com/">Newton de Góes Horta</a></td>
                    <td>Brasil</td>
                    <td>Minimalist design in blue</td>
                    <td><a href="http://www.nghorta.com/csstg/blue/table.css" title="Download the Blue CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r72" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/72.php">Azulon</a></th>
                    <td><a href="http://www.csslab.cl/">Joorge Epunan</a></td>
                    <td>Chile</td>
                    <td>Just playing with the ccode. I like the blue, and how it combines with other elements Looks pretty nice.</td>
                    <td><a href="http://www.csslab.cl/csstablegallery/azulon.css" title="Download the Azulon CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r71" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/71.php">Casablanca</a></th>
                    <td><a href="http://www.rodcast.com.br/">Rodrigo Castilho Galvao Ferreira</a></td>
                    <td>Brazil</td>
                    <td>Inspired by Casablanca Web Standards Template existing in Template Design Competition, WESTCIV.</td>
                    <td><a href="http://www.rodcast.com.br/csstablegallery/screen.css" title="Download the Casablanca CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r68" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/68.php">Blix Theme</a></th>
                    <td><a href="http://www.nghorta.com/">Newton de G�es Horta</a></td>
                    <td>Brasil</td>
                    <td>Table design based on Sebastian Schmieg&#39;s Blix Theme for Wordpress 2.0. Icons by Kevin Potts</td>
                    <td><a href="http://www.nghorta.com/csstg/table.css" title="Download the Blix Theme CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r64" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/64.php">Poetry For Browser</a></th>
                    <td><a href="http://www.webdesign-in.de/">Monika Thon-Soun</a></td>
                    <td>Austria</td>
                    <td>Code is Poetry. Internet Explorer you can&#39;t show us arrows and hover effects. You can&#39;t show us correct borders. It looks like that you can&#39;t understand poetry. Don&#39;t be jealous of browsers. It is simply:Learn to be a browser and everything is going to be alright.</td>
                    <td><a href="http://www.webdesign-in.de/barrierefrei/poetryforbrowser.css" title="Download the Poetry For Browser CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r61" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/61.php">Pretty In Pink</a></th>
                    <td><a href="http://www.arcsin.se/">Viktor Persson</a></td>
                    <td>Sweden</td>
                    <td>Smooth, pretty and pink. Best viewed in Mozilla Firefox.</td>
                    <td><a href="http://www.arcsin.se/external/csstablegallery/prettyinpink.css" title="Download the Pretty In Pink CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r60" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/60.php">Two times table</a></th>
                    <td><a href="http://www.cssplay.co.uk/">Stu Nicholls</a></td>
                    <td>England</td>
                    <td>A very basic table for all Internet Explorer users but something VERY different for understanding browsers :o Hope you like it.</td>
                    <td><a href="http://www.cssplay.co.uk/csstablegallery/two-times-table.css" title="Download the Two times table CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r58" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/58.php">bluish</a></th>
                    <td><a href="http://www.neukoellnstyle.de/">Stefan Herzig</a></td>
                    <td>Germany</td>
                    <td>Blue style with a hint of Amiga</td>
                    <td><a href="http://neukoellnstyle.de/tablegallery/nksTablegallery.css" title="Download the bluish CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r55" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/55.php">pop.pop.star</a></th>
                    <td><a href="http://www.javajim.de/">Timo Wirth</a></td>
                    <td>Germany</td>
                    <td>Inspired by Andy Warhol, this bold and simple table emphasizes the table rows (rather than the columns). </td>
                    <td><a href="http://www.javajim.de/csstablegallery/poppopstar.css" title="Download the pop.pop.star CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r54" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/54.php">Tabular tables</a></th>
                    <td><a href="http://www.cssplay.co.uk/">Stu Nicholls</a></td>
                    <td>England</td>
                    <td>A simple table using a little border art for mouseovers.</td>
                    <td><a href="http://www.cssplay.co.uk/csstablegallery/tabular-table.css" title="Download the Tabular tables CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r52" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/52.php">Sea Glass</a></th>
                    <td><a href="http://sillybean.net/">Stephanie Leary</a></td>
                    <td>US</td>
                    <td>Subtle and green.</td>
                    <td><a href="http://sillybean.net/css/seaglass.css" title="Download the Sea Glass CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r51" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/51.php">Orange Brownie</a></th>
                    <td><a href="http://www.codylindley.com/">Cody Lindley</a></td>
                    <td>US</td>
                    <td>Nice idea, the site that is.</td>
                    <td><a href="http://codylindley.com/orangebrownie.css" title="Download the Orange Brownie CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r50" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/50.php">Blaugrana</a></th>
                    <td><a href="http://dizque.lacalabaza.net/">Choan C. Glvez</a></td>
                    <td>Spain</td>
                    <td>Alternating row and link colors. Enhancements (hover, image replacement) for modern browsers.</td>
                    <td><a href="http://dizque.lacalabaza.net/ext/css-tables/css-tables.css" title="Download the Blaugrana CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r47" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/47.php">Shades of Blue</a></th>
                    <td><a href="http://www.vhg-design.com/">Velizar Garvalov</a></td>
                    <td>Bulgaria</td>
                    <td>Simple blue design with some :hover effects</td>
                    <td><a href="http://www.vhg-design.com/icant/vhg.css" title="Download the Shades of Blue CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r46" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/46.php">Gmail scrolling</a></th>
                    <td><a href="http://www.maujor.com/index.php">Mauricio Samy Silva</a></td>
                    <td>Brazil</td>
                    <td>A look-alike theme with fixed height for the table container DIV and vertical scroll bar. There is an :hover behavior on caption background image.</td>
                    <td><a href="http://www.maujor.com/temp/chris/gmail.css" title="Download the Gmail scrolling CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r45" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/45.php">Shades of Purple</a></th>
                    <td><a href="http://drafdesigns.com/">Demetrius Francis</a></td>
                    <td>Bahamas</td>
                    <td>Basic styles with a purple scheme.</td>
                    <td><a href="http://drafdesigns.com/shadesofpurple.css" title="Download the Shades of Purple CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r44" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/44.php">Turkish Delight</a></th>
                    <td><a href="http://www.fuzzyoutline.com/">Paul Brownsmith</a></td>
                    <td>UK</td>
                    <td>Raspberry shades with chocolate rollovers for compliant browsers. Clean, clear and choco-sweet.</td>
                    <td><a href="http://www.fuzzyoutline.com/style/tablegallery/tablestyle.css" title="Download the Turkish Delight CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r43" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/43.php">Grayed Out</a></th>
                    <td><a href="http://www.imaputz.com/">Terence Ordona</a></td>
                    <td>US</td>
                    <td>A simple look and feel that improves with the quality of your browser&#39;s CSS support. Shows possible use of a la Excel styling.</td>
                    <td><a href="http://www.imaputz.com/cssStuff/datatable.css" title="Download the Grayed Out CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r42" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/42.php">Nimbupani</a></th>
                    <td><a href="http://nimbupani.com/">Divya</a></td>
                    <td>Singapore</td>
                    <td>A minimalist style that explores the relative weights of the lines that differentiates one element from the other. The same design elements has also been used on this site http://jflickruploader.blogspot.com</td>
                    <td><a href="http://nimbupani.com/csstables/csstables.css" title="Download the Nimbupani CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r41" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/41.php">Trekkish Violets</a></th>
                    <td><a href="http://patrys.jogger.pl/">Patryk Zawadzki</a></td>
                    <td>Poland</td>
                    <td>Well... a bit trekkish I guess (but not really inspired by holodeck). Blues and violets here and there. Looks best when viewed in Firefox.</td>
                    <td><a href="http://wirusy.room-303.com/csstablegallery/violet.css" title="Download the Trekkish Violets CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r40" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/40.php">Golden style</a></th>
                    <td><a href="http://www.australien-panorama.de/">Michael Horn</a></td>
                    <td>Germany</td>
                    <td>Golden coloured style, with hover effects in modern browsers (Firefox, Opera). </td>
                    <td><a href="http://www.australien-panorama.de/several/golden.css" title="Download the Golden style CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r39" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/39.php">Oranges In The Sky</a></th>
                    <td><a href="http://www.makaveev.com/">Krasimir Makaveev</a></td>
                    <td>Bulgaria</td>
                    <td>Just a simple table design with orange and blue links!</td>
                    <td><a href="http://www.makaveev.com/lab/css_table_gallery/oranges-in-the-sky.css" title="Download the Oranges In The Sky CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r38" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/38.php">Rockstar</a></th>
                    <td><a href="http://www.jedisthlm.com/">Jens Wedin</a></td>
                    <td>Sweden</td>
                    <td>Simple classic design with advanced stuff for standard compliant browsers.</td>
                    <td><a href="http://jedisthlm.com/testarea/rockstar.css" title="Download the Rockstar CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r37" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/37.php">Greyscale</a></th>
                    <td><a href="http://www.twoplusfour.co.uk/">Two Plus Four</a></td>
                    <td>UK</td>
                    <td>Minimalist design in black, white and shades of grey. Resizeable text and CCS2 enhancements for those that know.</td>
                    <td><a href="http://concreteandclay.dreamhosters.com/csstablegallery/greyscale.css" title="Download the Greyscale CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r36" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/36.php">Coffee with milk</a></th>
                    <td><a href="http://www.456bereastreet.com/">Roger Johansson</a></td>
                    <td>Sweden</td>
                    <td>Clean, no-nonsense design with a latte-ish colour palette. Some extra design features in modern browsers.</td>
                    <td><a href="http://www.456bereastreet.com/lab/css-table-gallery/coffee-with-milk.css" title="Download the Coffee with milk CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r35" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/35.php">Clean and crisp</a></th>
                    <td><a href="http://blogs.su.se/matlin/">Mats Lindblad</a></td>
                    <td>Sweden</td>
                    <td>Clean and Crips table style, with a little MS feel to it. Although it works best in Firefox.</td>
                    <td><a href="http://blogs.su.se/~matlin/cnc.css" title="Download the Clean and crisp CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r33" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/33.php">Winter Blues</a></th>
                    <td><a href="http://www.klavina.com/">Gunta Klavina</a></td>
                    <td>Latvia</td>
                    <td>Blue pastel coloured style.</td>
                    <td><a href="http://www.klavina.com/csstablegallery/winterblues.css" title="Download the Winter Blues CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r32" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/32.php">Green Life</a></th>
                    <td><a href="http://www.alvit.de/vf">Vitaly Friedman</a></td>
                    <td>Germany</td>
                    <td>A Fresh, Warm and Readable Table</td>
                    <td><a href="http://www.alvit.de/vf/csstablegallery/tables.css" title="Download the Green Life CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r29" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/29.php">iTunes</a></th>
                    <td><a href="http://www.johnlawrence.net/">John Lawrence</a></td>
                    <td>UK</td>
                    <td>Table design based on Apple&#39;s iTunes software.</td>
                    <td><a href="http://www.johnlawrence.net/itable/itunes.css" title="Download the iTunes CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r28" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/28.php">MintGreen</a></th>
                    <td><a href="http://taimar.pri.ee/">Taimar Teetlok</a></td>
                    <td>Estonia</td>
                    <td>Warm and friendly mint-green presentation.</td>
                    <td><a href="http://taimar.pri.ee/examples/table-design/mintgreen.css" title="Download the MintGreen CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r27" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/27.php">Heaven is Closer</a></th>
                    <td>Niko Neugebauer</td>
                    <td>Portugal</td>
                    <td>A simple style that improves with the quality of your browser&#39;s CSS support</td>
                    <td><a href="http://nikoport.com/xperiments/css/table_gallery/niko.css" title="Download the Heaven is Closer CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r25" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/25.php">Cygenta</a></th>
                    <td><a href="http://bon.gs/">Tim Baker</a></td>
                    <td>Canada</td>
                    <td>Monospaced with a painful palette.</td>
                    <td><a href="http://bon.gs/projects/csstablegallery/cga.css" title="Download the Cygenta CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r24" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/24.php">Spread Firefox!</a></th>
                    <td><a href="http://www.tjkdesign.com/">Thierry Koblentz</a></td>
                    <td>USA</td>
                    <td>Best experience in Firefox! ;-)</td>
                    <td><a href="http://www.tjkdesign.com/zen/table/table.css" title="Download the Spread Firefox! CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r22" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/22.php">Muted</a></th>
                    <td><a href="http://www.clacksweb.org.uk/">Dan Champion</a></td>
                    <td>Scotland</td>
                    <td>Grey and beige, clean and simple. Minimal use of CSS2 fancy bits like :after and tr:hover.</td>
                    <td><a href="http://www.clacksweb.org.uk/css/cwtable.css" title="Download the Muted CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r19" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/19.php">Inset cells</a></th>
                    <td><a href="http://www.maujor.com/index.php">Mauricio Samy Silva</a></td>
                    <td>Brazil</td>
                    <td>A table with inset cells and the use of adjacent-sibling selectors and border-spacing propertie for compliants browsers.</td>
                    <td><a href="http://www.maujor.com/temp/chris/inset.css" title="Download the Inset cells CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r16" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/16.php">Lab Report</a></th>
                    <td><a href="http://www.classical-webdesigns.co.uk/">Louise Dade</a></td>
                    <td>UK</td>
                    <td>Clear, simple and informative data display for a scientific paper. Includes a background image, download icon and a &quot;faux alpha transparency&quot; rollover effect (a tiny tile with every other pixel transparent). Fully commented CSS file.</td>
                    <td><a href="http://www.classical-webdesigns.co.uk/cssexps/labreport.css" title="Download the Lab Report CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r13" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/13.php">Orange You Glad</a></th>
                    <td><a href="http://www.randypeterman.com/">Randy Peterman</a></td>
                    <td>USA</td>
                    <td>There is an image required for standards compliant browsers to get a &#39;bonus&#39; download arrow for the download links.</td>
                    <td><a href="http://randypeterman.com/CSSTableGallery/OrangeYouGlad.css" title="Download the Orange You Glad CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r11" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/11.php">10 minutes</a></th>
                    <td><a href="http://www.dramatic.co.nz/">Richard Grevers</a></td>
                    <td>New Zealand</td>
                    <td>Minimalist, using separated borders and spacing with a four-colour pallette.</td>
                    <td><a href="http://www.dramatic.co.nz/tablegallery/dramatic.css" title="Download the 10 minutes CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r10" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/10.php">Spearmint tints</a></th>
                    <td><a href="http://inspire.server101.com/ben/resume/">Ben Boyle</a></td>
                    <td>AUS</td>
                    <td>Simple coloured style with a minty theme.</td>
                    <td><a href="http://inspire.server101.com/bttdb/html/tables/spearmint-tints.css" title="Download the Spearmint tints CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r9" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/9.php">Table structure</a></th>
                    <td><a href="http://inspire.server101.com/ben/resume/">Ben Boyle</a></td>
                    <td>AUS</td>
                    <td>Contrasts headings and cells, displays heading scope and summary (where supported).</td>
                    <td><a href="http://inspire.server101.com/bttdb/html/tables/structure.css" title="Download the Table structure CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r7" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/7.php">Alpha transparency</a></th>
                    <td><a href="http://www.maujor.com/index.php">Mauricio Samy Silva</a></td>
                    <td>Brazil</td>
                    <td>Simulating alpha transparency with CSS</td>
                    <td><a href="http://www.maujor.com/temp/chris/alpha.css" title="Download the Alpha transparency CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r6" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/6.php">Grey suits you sir</a></th>
                    <td><a href="http://www.muffinresearch.co.uk/">Stuart Colville</a></td>
                    <td>UK</td>
                    <td>Smart grey table with hover effect.</td>
                    <td><a href="http://www.muffinresearch.co.uk/lab/tableshow/muffin.css" title="Download the Grey suits you sir CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r5" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/5.php">Cusco Sky</a></th>
                    <td><a href="http://www.buayacorp.com/">Braulio Andrs Soncco Pimentel</a></td>
                    <td>Per</td>
                    <td>Soft blues like Cusco Sky</td>
                    <td><a href="http://test.buayacorp.com/cuscosky.css" title="Download the Cusco Sky CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r3" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/3.php">Blue On Blue</a></th>
                    <td><a href="http://slaven.net.au/">Glenn Slaven</a></td>
                    <td>AUS</td>
                    <td>A serif font table with a bit of colour to define the cells.</td>
                    <td><a href="http://blog.slaven.net.au/wp-content/csstables/blueonblue.css" title="Download the Blue On Blue CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r2" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/2.php">Chrome de la chrome</a></th>
                    <td><a href="http://www.wait-till-i.com/">Chris Heilmann</a></td>
                    <td>UK</td>
                    <td>Using gradient backgrounds to create chrome effects</td>
                    <td><a href="http://icant.co.uk/csstablegallery/chrome.css" title="Download the Chrome de la chrome CSS file">Download</a></td>
                </tr>
                <tr class="odd">
                    <th id="r1" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/1.php">Minimalist</a></th>
                    <td><a href="http://www.wait-till-i.com/">Chris Heilmann</a></td>
                    <td>UK</td>
                    <td>As minimal as you can get, only lines around the body cells</td>
                    <td><a href="http://icant.co.uk/csstablegallery/minimal.css" title="Download the Minimalist CSS file">Download</a></td>
                </tr>
                <tr>
                    <th id="r0" scope="row"><a href="http://icant.co.uk/csstablegallery/tables/0.php">Plain old table</a></th>
                    <td><a href="http://www.wait-till-i.com/">Chris Heilmann</a></td>
                    <td>UK</td>
                    <td>Tried and true, boring grey table with a one pixel line</td>
                    <td><a href="http://icant.co.uk/csstablegallery/plainold.css" title="Download the Plain old table CSS file">Download</a></td>
                </tr>
            </table>
        </div>
        <div id="textcontent">
            <h2 id="what">&nbsp;</h2>
        </div>
        <br />
        <br />
        <br />
    





    </div>
    </form>
</body>
</html>
