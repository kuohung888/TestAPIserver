<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeFile="Async_Reader.aspx.cs" Inherits="Ch14_Default_1_0_DataReader_Manual" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>非同步（異步）DataReader -- Only .NET 4.5</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            只有 .NET 4.5（含）後續新版本才有！

            <br /><br /><hr /><br />

        </div>


        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button_非同步（異步）DataReader -- Only .NET 4.5" />


        <br />
        <br />
        <br />
        重點說明：<br />
        <br />
        第一，先在&lt;%@ Page指示詞加上 <strong>Async=&quot;true&quot;</strong>。<br />
        <br />
        第二，在網站（或專案）按下滑鼠右鍵，<strong>在NuGet裡面搜尋「Microsoft.bcl.Async」</strong>並且安裝。</form>

</body>
</html>

