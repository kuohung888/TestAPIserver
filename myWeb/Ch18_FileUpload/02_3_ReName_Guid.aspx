<%@ Page Language="C#" AutoEventWireup="true" CodeFile="02_3_ReName_Guid.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_02_3_ReName_Guid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF00;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .style1 {
            color: #FF0000;
        }
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        透過Guid產生亂數（不重複）檔名

     
        <br />
        <a href="https://msdn.microsoft.com/zh-tw/library/system.guid.newguid(v=vs.110).aspx">https://msdn.microsoft.com/zh-tw/library/system.guid.newguid(v=vs.110).aspx</a><br />
        <br />
        上傳成功以後，改用 <span class="auto-style1">Guid.NewGuid()</span>.ToString(<span class="auto-style2">&quot;N&quot;</span>)當成檔名<br />
        <br />
        <h4>檔案上傳 ＃2-3(檔名重複的話，檔名改用Guid) :</h4>
        <p>
            <span class="style1">請您先開啟 </span><span class="style2">d:\temp\uploads\</span><span
                class="style1">的目錄，程式才能完成上傳</span>
        </p>

        請先選取檔案，然後再上傳：<asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>

        <br />
        <br />

        <asp:Button ID="Button1" Text="檔案上傳" runat="server" OnClick="Button1_Click"></asp:Button>
        <br />
        <br />

        <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
