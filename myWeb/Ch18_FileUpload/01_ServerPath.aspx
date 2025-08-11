<%@ Page Language="C#" AutoEventWireup="true" CodeFile="01_ServerPath.aspx.cs" Inherits="Ch18_FileUpload_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ASP.NET FileUpload #1</title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            font-weight: bold;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h4>
            檔案上傳 ＃1 (Select a file to upload) :</h4>
        <p class="style1">
            請您先開啟  <b>c:\temp\uploads\</b>的目錄，程式才能完成上傳</p>
        <p class="style1">
            本範例提供三種&nbsp;&nbsp; 上傳檔案的<span class="style2">「Server端 路徑」</span>寫法，很重要！！</p>
        請先選取檔案，然後再上傳：

        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" Text="檔案上傳" runat="server" OnClick="Button1_Click"></asp:Button>

        <hr />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
