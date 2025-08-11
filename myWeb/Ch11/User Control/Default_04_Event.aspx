<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default_04_Event.aspx.cs" Inherits="Default_04_Event" %>

<!-- '** 重點在此！！ ************ -->
<%@ Register Src="WebUserControl_04_Event.ascx" TagName="GridView1" TagPrefix="mis2000lab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <br />
         <br />
         使用 UC的<span class="style1">自訂事件</span>，檔名 WebUserControl_04_Event.ascx。
         <hr />
         <br />
    
        <!-- '** 重點在此！！ ************ -->
        <mis2000lab:GridView1 runat="server" ID="mis2000GV" 
            Onmis2000lab_EditRecord="mis2000GV_mis2000lab_EditRecord" 
            Onmis2000lab_FinishedEditRecord="mis2000GV_mis2000lab_FinishedEditRecord"  />


    </div>
    </form>
</body>
</html>

