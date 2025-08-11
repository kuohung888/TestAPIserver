<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_Table_01.aspx.cs" Inherits="Book_Sample_Ch12_ListView_HTML_Table_HTML_Table_01" %>

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
        <strong><span class="auto-style1">HTML表格（基礎篇 &lt;Table&gt;）</span></strong><br />
        <br />

        第一個範例共有&nbsp; 橫的「三列」，就是
            標籤&lt;tr&gt;。
 
        <br />
        每一列之中，又有兩個儲存格（欄位），即 &lt;td&gt; 標籤。 <br />
    <br />
    <br />

        <table border="1" width="90%">
            <tr>
                <td width="50%">111A</td>
                <td width="50%">111B</td>
            </tr>

            <tr>
                <td width="50%">222A</td>
                <td width="50%">222B</td>
            </tr>

            <tr>
                <td width="50%">333A</td>
                <td width="50%">333V</td>
            </tr>
        </table>

        <br />
        <br />



     
        ===========================================================================<br />
        <br />
        第二個範例，只有兩列（兩個&lt;tr&gt;標籤）。<br />
        每一列裡面，只有一個 &lt;td&gt;儲存格（欄位、格子）。<br />
        <br />
        <br />

        <table border="1" width="90%">
            <tr>
                <td>111A</td>
            </tr>

            <tr>
                <td>222A</td>
            </tr>
        </table>

        <br />
        <br />
        ===========================================================================<br />
        <br />
        第三個範例，一列 &lt;tr&gt; 裡面，有兩個 &lt;td&gt; 儲存格（欄位、格子）<br />
        <br />
        <br />

        <table border="1" width="90%">
            <tr>
                <td width="50%">111A</td>
                <td width="50%">111B</td>
            </tr>
        </table>

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
