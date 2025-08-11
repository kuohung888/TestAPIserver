<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_Table_03_CSS.aspx.cs" Inherits="Book_Sample_Ch12_ListView_HTML_Table_HTML_Table_03_CSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        /*  範例開始(start) */
        table {
            display: table;
            border-collapse: separate;
            border-spacing: 2px;
            border-color: gray
        }

        thead {
            display: table-header-group;
            vertical-align: middle;
            border-color: inherit
        }

        tbody {
            display: table-row-group;
            vertical-align: middle;
            border-color: inherit
        }

        tfoot {
            display: table-footer-group;
            vertical-align: middle;
            border-color: inherit
        }

        table > tr {
            vertical-align: middle;
        }

        col {
            display: table-column
        }

        colgroup {
            display: table-column-group
        }

        tr {
            display: table-row;
            vertical-align: inherit;
            border-color: inherit
        }

        td, th {
            display: table-cell;
            vertical-align: inherit
        }

        th {
            font-weight: bold
        }

        caption {
            display: table-caption;
            text-align: -webkit-center
        }
        /*  範例結束(end) */


        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

    <p>
    
        <strong><span class="auto-style1">HTML表格（基礎篇 #3&nbsp; CSS繪製表格）</span></strong><br />
        請參閱這篇文章：<a href="http://css-tricks.com/complete-guide-table-element/">http://css-tricks.com/complete-guide-table-element/</a>

        
        <br />
        <br />
        <br />
    </p>

            <table border="1" width="90%">
                <thead>
                    <tr>
                        <!-- 註解：這是「標題」列。 -->
                        <th width="50%">標題A</th>
                        <th width="50%">標題B</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <!-- 註解：這是「內容」列。 -->
                        <td width="50%">AAA</td>
                        <td width="50%">BBB</td>
                    </tr>
                </tbody>
            </table>



            <p>
                &nbsp;</p>
    <p>
        &nbsp;</p>

    
    </div>
    </form>
    <p>
        這裡有很多套的 CSS + Table的樣式，您可以自行參考</p>
    <p>
        <a href="http://icant.co.uk/csstablegallery/tables/13.php">http://icant.co.uk/csstablegallery/tables/13.php</a>
    </p>
</body>
</html>
