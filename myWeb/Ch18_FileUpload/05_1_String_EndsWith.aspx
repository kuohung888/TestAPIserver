<%@ Page Language="C#" AutoEventWireup="true" CodeFile="05_1_String_EndsWith.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_5_1_String_EndsWith" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .style1
        {
            background-color: #66FF66;
        }
        .style2
        {
            color: #003300;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h4>
            檔案上傳 ＃5(Select a file to upload) :</h4>
        請先選取檔案，然後再上傳：<asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
        <br />
        <br />
        <asp:Button ID="Button1" Text="檔案上傳" runat="server" onclick="Button1_Click"></asp:Button>
        <hr />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
    <p>
        <span class="style1">範例 5_1_String_EndWith.aspx上載的檔案，其 &quot;副檔名&quot; 只允許為 .doc或 .xls。</span></p>
    <p>
        <span class="style1">此控制項會呼叫 <span class="style2">字串的 .EndsWith()方法</span>，以傳回要上載之檔案名稱的
            “副檔名”。</span></p>



        <a href="http://msdn.microsoft.com/zh-tw/library/system.string.endswith(v=VS.100).aspx">
            http://msdn.microsoft.com/zh-tw/library/system.string.endswith(v=VS.100).aspx</a>
    </div>

</body>
</html>
