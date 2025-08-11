<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_RowDataBound_2_CaseStudy_ADOnet.aspx.cs" Inherits="Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_2_CaseStudy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>使用 student_test資料表，成績低於60分就會出現紅字</title>
    <style type="text/css">
        .style1
        {
            color: #99FF66;
            font-weight: bold;
            background-color: #006600;
        }
        .style2
        {
            font-size: small;
        }
        .auto-style2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        使用 ADO.NET來做這個範例，好辛苦！<br />
        <br />
        <br />
        <span class="auto-style2"><strong>使用 student_test資料表，成績低於60分就會出現紅字</strong></span><br />
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />

    </div>
    </form>
</body>
</html>
