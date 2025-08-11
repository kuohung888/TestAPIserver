<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_05_Event_OK.aspx.cs" Inherits="Default_05_Event_OK" %>


<!-- '** 重點在此！！ ************ -->
<%@ Register Src="WebUserControl_05_Event_OK.ascx" TagName="GridView1" TagPrefix="mis2000lab" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <br /><br />
         使用 UC的<span class="style1">自訂事件</span>，檔名 WebUserControl_05_Event_OK.ascx。
         <hr /><br />
    

         請按下UC裡面的「編輯」按鈕<br /><br />

        <!-- '** 重點在此！！ ************ -->
        <mis2000lab:GridView1 runat="server" ID="mis2000GV" />

    </div>
    </form>
</body>
</html>

