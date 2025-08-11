<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_20_03_DB_Default.aspx.cs" Inherits="Book_Sample_Ch11_NPOI_v2131_Default_DB_03" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搭配ADO.NET，將資料表查詢成果，輸出道Excel檔。</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>NPOI 2.x版。產生一個「中文名稱」的工作表 (WorkSheet)</h3>
        <h3>並且使用ADO.NET程式，在儲存格裡面寫入資料</h3>
    </div>


        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="NPOI原廠範例修改而來，匯出Excel檔案" />
    </form>
</body>
</html>
