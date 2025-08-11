<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_02_DB_createFreezePane_v124.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_02_DB_createFreezePane_v124" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>凍結欄位（鎖定欄位）</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
    
        .style3
        {
            font-size: x-large;
        }
        .style4
        {
            color: #0000FF;
            font-weight: bold;
            background-color: #FFCC66;
        }
        .style5
        {
            color: #0000FF;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            在 試算表的Sheet裡面 添加資料<span class="style1"> (From DB) </span>
            <br />
            把資料庫裡面的 Test資料表，寫入 Excel裡面。
             
                <br />
            <br />
            <br />
            <br />
            <br />
            <div>

                <span class="style5">請把<strong> /bin目錄</strong>下，<strong>舊版</strong> NPOI的 
        .DLL檔都<strong> [刪除]</strong>以後，再來加入新版本的 .DLL檔。</span><br class="style5" />
                <br class="style5" />
                <strong><span class="style4">NPOI v1.2.4版</span><span class="style3">&nbsp; 新的寫法（ CreateFreezePane()方法，凍結欄位、鎖定欄位 ）</span></strong>
            </div>
        </div>
        <br />
        <asp:Button ID="Button1" runat="server" Text="在 試算表的Sheet裡面 添加資料 (From DB)"
            OnClick="Button1_Click" />
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        資料來源：</p>
    <p>
        POI -- <a href="http://poi.apache.org/apidocs/org/apache/poi/hssf/usermodel/HSSFSheet.html#createFreezePane(int, int)">http://poi.apache.org/apidocs/org/apache/poi/hssf/usermodel/HSSFSheet.html#createFreezePane(int, int)</a></p>
    <p>
        <a href="http://www.cnblogs.com/atao/archive/2009/09/18/1568918.html">http://www.cnblogs.com/atao/archive/2009/09/18/1568918.html</a></p>
    <p>
        <a href="http://pvencs.blogspot.tw/2012/09/poi-excel.html">http://pvencs.blogspot.tw/2012/09/poi-excel.html</a></p>
</body>
</html>

