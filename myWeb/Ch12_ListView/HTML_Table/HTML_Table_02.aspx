<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_Table_02.aspx.cs" Inherits="Book_Sample_Ch12_ListView_HTML_Table_HTML_Table_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong><span class="auto-style1">HTML表格（基礎篇 #2&nbsp; &lt;Table&gt;）</span></strong><br />
        請參閱這篇文章：<a href="http://css-tricks.com/complete-guide-table-element/">http://css-tricks.com/complete-guide-table-element/</a>

        
        <br />
        <br />
        <br />
        <br />
        &lt;th&gt;標題（表頭）文字<br />
        <br />

        <table border="1" width="90%">
            <tr>
                <th width="50%">標題A</th>
                <th width="50%">標題B</th>
            </tr>
            <tr>
                <td width="50%">AAA</td>
                <td width="50%">BBB</td>
            </tr>
        </table>

        <br />
        <br />
        *****************************************************************************<br />

        <br />
        &lt;thead&gt; &lt;th&gt;標題（表頭）文字<br />
        &lt;tbody&gt; 內容<br />
        <br />

        <table border="1" width="90%">
            <thead>
                <tr>
                    <th width="50%">標題A</th>
                    <th width="50%">標題B</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td width="50%">AAA</td>
                    <td width="50%">BBB</td>
                </tr>
            </tbody>
        </table>

        <br />
        <br />
        *****************************************************************************<br />
        <br />



        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />


    </div>
    </form>
</body>
</html>
