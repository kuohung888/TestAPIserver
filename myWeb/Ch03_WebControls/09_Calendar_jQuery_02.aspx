<%@ Page Language="C#" AutoEventWireup="true" CodeFile="09_Calendar_jQuery_02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_09_Calendar_jQuery_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#TextBox1").datepicker();
            //*** 重點！！請把畫面上 TextBox的「ID」寫到這裡！！ ***

            $("#format").change(function () {
                $("#TextBox1").datepicker("option", "dateFormat", $(this).val());
                //*** 重點！！請把畫面上 TextBox的「ID」寫到這裡！！ ***
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            用日曆挑選日期，jQuery版（DatePicker套件）#2<br />
            <br />
            資料來源：<a href="http://jqueryui.com/datepicker/#date-formats">http://jqueryui.com/datepicker/#date-formats</a>
            <br />
            <br />
            <br />
            請輸入日期：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            (ReadOnly=true。請把ID = &quot;TextBox1&quot;寫到 jQuery程式裡面。)<br />
            <br />
            <br />..................................................................................................
            <p>
                Format options:<br />
                <select id="format">
                    <option value="mm/dd/yy">Default - mm/dd/yy</option>
                    <option value="yy/mm/dd">ASP.NET格式（MIS2000Lab.）- yy/mm/dd</option>
                    <option value="yy-mm-dd">ISO 8601 - yy-mm-dd</option>
                    <option value="d M, y">Short - d M, y</option>
                    <option value="d MM, y">Medium - d MM, y</option>
                    <option value="DD, d MM, yy">Full - DD, d MM, yy</option>
                    <option value="'day' d 'of' MM 'in the year' yy">With text - 'day' d 'of' MM 'in the year' yy</option>
                </select>
            </p>

        </div>
    </form>
</body>
</html>

