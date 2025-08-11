<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NPOI_20_02.aspx.cs" Inherits="NPOI_20_02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        NPOI 2.0 範例 -- 儲存格加入文字<br />
    
    </div>

        <br />
        NPOI 2.0的命名空間與 .DLL檔案（加入參考） ----<br />
        HSSF（Excel 2003）, XSSF（Excel 2007）, XWPF（Word 2007）。 
        <br /><br />
        資料來源 <a href="http://tonyqus.sinaapp.com/archives/482">http://tonyqus.sinaapp.com/archives/482</a>
        <br /><br />


        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button2_XSSF產生 Excel 2007" />
    </form>
</body>
</html>
